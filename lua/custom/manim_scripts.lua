-- ~/.config/nvim/lua/manim_scripts.lua

local M = {}

function M.manim_render_quick()
    -- 1. Salva il file (fondamentale per Manim)
    vim.cmd("write")
    
    -- 2. Trova il nome della classe Scene sotto o sopra il cursore
    local class_name = nil
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    
    -- Cerca all'indietro dalla riga del cursore per trovare 'class NomeClasse(Scene):'
    for i = curr_line, 1, -1 do
        local match = lines[i]:match("class%s+(%w+)%(%w*Scene%w*%)")
        if match then
            class_name = match
            break
        end
    end

    if not class_name then
        print("❌ Errore: Nessuna classe 'Scene' trovata sopra il cursore.")
        return
    end

    -- 3. Prepara il comando
    -- -ql : Qualità bassa (480p 15fps) -> rendering quasi istantaneo
    -- -p  : Preview (apre il video appena finito)
    -- -v WARNING : Riduce il rumore nel terminale
    local file_path = vim.fn.expand("%")
    local cmd = string.format("manim -ql -p -v WARNING %s %s", file_path, class_name)
    
    print("🚀 Rendering " .. class_name .. " [Qualità Bassa]...")

    -- 4. Esecuzione asincrona (Neovim non si blocca)
    vim.fn.jobstart(cmd, {
        on_exit = function(_, exit_code)
            if exit_code == 0 then
                print("✅ Finito! Anteprima aperta per: " .. class_name)
            else
                print("⚠️ Errore durante il rendering di " .. class_name)
            end
        end
    })
end

return M
