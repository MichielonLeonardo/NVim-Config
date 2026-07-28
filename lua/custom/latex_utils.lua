-- ~/.config/nvim/lua/latex_utils.lua
local M = {}

local function write_focus(content, message)
    local main_tex = vim.fn.findfile("main.tex", ".;")
    if main_tex == "" then return print("Errore: main.tex non trovato.") end
    local root = vim.fn.fnamemodify(main_tex, ":p:h")
    local f = io.open(root .. "/current_chapter.tex", "w")
    if f then f:write(content); f:close(); print(message) end
end

function M.focus_current()
    local name = vim.fn.expand("%:t:r")
    write_focus("\\includeonly{capitoli/" .. name .. "}", "Focus attivo su: " .. name)
end

function M.pick_chapter()
    local files = vim.fn.glob("capitoli/*.tex", false, true)
    if #files == 0 then return print("Nessun file trovato") end
    local menu = {"Seleziona i capitoli (es: 1,3):"}
    local names = {}
    for i, file in ipairs(files) do
        local name = vim.fn.fnamemodify(file, ":t:r")
        table.insert(names, name)
        table.insert(menu, i .. ". " .. name)
    end
    local input = vim.fn.input(table.concat(menu, "\n") .. "\n> ")
    local selected = {}
    for num in string.gmatch(input, "([^,]+)") do
        local idx = tonumber(num)
        if idx and names[idx] then table.insert(selected, "capitoli/" .. names[idx]) end
    end
    if #selected > 0 then
        write_focus("\\includeonly{" .. table.concat(selected, ",") .. "}", "Focus attivo")
    end
end

function M.focus_all()
    write_focus("% \\includeonly{}", "Reset: compila tutto")
end

function M.create_inkscape_drawing()
    local name = vim.fn.input("Nome del disegno: ")
    if name == "" then return end
    vim.fn.jobstart({"tex-img", name}, {
        on_exit = function()
            local figure_code = {
                "\\begin{figure}[H]",
                "    \\centering",
                "    \\def\\svgwidth{0.6\\textwidth}",
                "    \\input{immagini/" .. name .. ".pdf_tex}",
                "    \\caption{" .. name .. "}",
                "    \\label{fig:" .. name .. "}",
                "\\end{figure}"
            }
            vim.api.nvim_put(figure_code, "l", true, true)
        end
    })
end

function M.edit_inkscape_drawing()
    -- Facciamo partire lo script senza passargli argomenti, 
    -- dato che ci penserà wofi a farti scegliere il file.
    vim.fn.jobstart({"tex-img-edit"}, {
        on_exit = function(_, exit_code)
            -- exit_code 0 significa che lo script è arrivato alla fine con successo
            if exit_code == 0 then
                vim.notify("Disegno aggiornato ed esportato in PDF/LaTeX!", vim.log.levels.INFO)
            else
                vim.notify("Modifica annullata o nessun file selezionato.", vim.log.levels.WARN)
            end
        end
    })
end

function M.screenshot_to_latex()
    -- 1. Chiede il nome dell'immagine
    local name = vim.fn.input("Nome immagine (senza .png): ")
    if name == "" then 
        print("\nScreenshot annullato.")
        return 
    end

    -- 2. Trova la radice del progetto
    local main_tex = vim.fn.findfile("main.tex", ".;")
    local out_dir = "../immagini"
    local latex_include = "../immagini/" .. name .. ".png"

    if main_tex ~= "" then
        local root = vim.fn.fnamemodify(main_tex, ":p:h")
        out_dir = root .. "/immagini"
        latex_include = "/immagini/" .. name .. ".png" 
    end

    -- 3. Crea la cartella se non esiste
    vim.fn.system("mkdir -p " .. out_dir)
    local filepath = out_dir .. "/" .. name .. ".png"

    print("\nVai al workspace desiderato e seleziona l'area...")
    vim.cmd("redraw") -- Forza Nvim a mostrare il messaggio

    -- 4. Esegue lo screenshot con grim e slurp
    local cmd = string.format('grim -g "$(slurp)" "%s"', filepath)
    vim.fn.system(cmd)

    -- 5. Controlla se l'utente ha annullato (premendo Esc su slurp)
    if vim.v.shell_error ~= 0 then
        vim.fn.system("rm -f " .. filepath) -- Pulisce file vuoti residui
        print("\nScreenshot annullato.")
        return
    end

    -- 6. Inserisce il codice LaTeX sotto il cursore
    local caption_name = name:gsub("_", " ")
    local latex_snippet = {
        "",
        "\\begin{figure}[H]",
        "    \\centering",
        "    \\includegraphics[width=0.5\\linewidth]{" .. latex_include .. "}",
        "    \\caption{" .. caption_name .. "}",
        "    \\label{fig:" .. name .. "}",
        "\\end{figure}",
        ""
    }

    vim.api.nvim_put(latex_snippet, "l", true, true)
    print("\nImmagine inserita con successo!")
end

-- Funzione Helper per scrivere il puntatore di stile
local function write_style(content, message)
    local main_tex = vim.fn.findfile("main.tex", ".;")
    if main_tex == "" then 
        return print("Errore: main.tex non trovato. Sei nella root del progetto?") 
    end
    
    local root = vim.fn.fnamemodify(main_tex, ":p:h")
    local style_file_path = root .. "/config/current_style.tex"
    
    local f = io.open(style_file_path, "w")
    if f then 
        f:write(content)
        f:close()
        print(message) 
    else
        print("Errore: Impossibile scrivere su " .. style_file_path)
    end
end

-- La Funzione Interattiva per scegliere lo stile
function M.pick_style()
    -- IMPORTANTE: Assicurati che questo percorso corrisponda alla tua cartella reale.
    -- Espande la tilde (~) nel percorso assoluto corretto.
    local styles_dir = vim.fn.expand("~/texmf/tex/latex/local/uni-styles/")
    
    -- Cerca tutti i file .tex in quella cartella
    local files = vim.fn.glob(styles_dir .. "*.tex", false, true)
    
    if #files == 0 then 
        return print("Nessun template trovato in " .. styles_dir) 
    end
    
    local menu = {"Seleziona lo stile centralizzato:"}
    local names = {}
    
    -- Costruisce il menu interattivo
    for i, file in ipairs(files) do
        -- Estrae solo il nome del file senza estensione e percorso (es. "classic")
        local name = vim.fn.fnamemodify(file, ":t:r")
        table.insert(names, name)
        table.insert(menu, i .. ". " .. name)
    end
    
    -- Mostra il menu all'utente e aspetta l'input
    local input = vim.fn.input(table.concat(menu, "\n") .. "\n> ")
    local idx = tonumber(input)
    
    -- Applica la scelta
    if idx and names[idx] then 
        local selected_style = "uni-styles/" .. names[idx]
        -- Scrive \input{uni-styles/nome_stile} nel file current_style.tex
        write_style("\\input{" .. selected_style .. "}", "Stile aggiornato a: " .. names[idx])
    else
        print("\nSelezione non valida o annullata.")
    end
end


return M
