local api = vim.api

-- ==========================================
-- 1. SINCRONIZZAZIONE TEX (tex-sync)
-- ==========================================
local sync_group = api.nvim_create_augroup("TexSyncExit", { clear = true })

api.nvim_create_autocmd("VimLeavePre", {
    group = sync_group,
    pattern = { "*/uni/*.tex", "*/uni/**/*.tex" },
    callback = function()
        vim.fn.system({"tex-sync"})
    end,
    desc = "Lancia tex-sync quando esci da un file universitario"
})

-- ==========================================
-- 2. SNIPPETS PER LA TESI (UltiSnips)
-- ==========================================
local thesis_group = api.nvim_create_augroup("ThesisSnippets", { clear = true })

api.nvim_create_autocmd({"BufRead", "BufNewFile", "BufEnter"}, {
    group = thesis_group,
    pattern = "*.tex", -- Si attiva su TUTTI i file LaTeX
    callback = function(args)
        -- Estrae il percorso assoluto infallibile del buffer corrente
        local filepath = vim.api.nvim_buf_get_name(args.buf)
        
        -- Cerca la stringa esatta della tua cartella all'interno del percorso
        if string.find(filepath, "uni/3a/Tesi", 1, true) then
            -- Applica il filetype aggiuntivo solo per questo buffer
            vim.cmd('call UltiSnips#AddFiletypes("thesis")')
        end
    end,
    desc = "Carica gli snippet specifici per la tesi tramite controllo del percorso"
})
