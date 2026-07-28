return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      -- Tentativo sicuro di caricamento: se fallisce, non crasha l'editor
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        vim.notify("Treesitter in attesa di installazione. Apri il menu con :Lazy", vim.log.levels.WARN)
        return
      end

      configs.setup({
        ensure_installed = {'lua', 'python', 'bash', 'markdown' },
        highlight = {
          enable = true,
          -- Funzione intelligente per prevenire il lag
          disable = function(lang, buf)
            if lang == "latex" or lang == "tex" then
              return true
            end
            local max_filesize = 100 * 1024 -- 100 KB
            local ok_stat, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok_stat and stats and (stats.size > max_filesize) then
              return true
            end
          end,
        },
        indent = { enable = true },
      })
    end
  }
}
