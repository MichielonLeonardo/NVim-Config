return {
  {
    "junegunn/fzf.vim",
    -- FZF richiede il binario di base per funzionare
    dependencies = {
      {
        "junegunn/fzf",
        build = "./install --all",
      }
    },
    -- Carichiamo il plugin solo quando premiamo uno di questi tasti
    keys = {
      { "<C-p>", "<cmd>Files<CR>", desc = "Trova File (FZF)" },
      { "<leader>b", "<cmd>Buffers<CR>", desc = "Trova Buffer (FZF)" },
      { "<leader>p", "<cmd>Files ..<CR>", desc = "Trova File (Livello Superiore)" },
      { "<leader>P", "<cmd>Files ~<CR>", desc = "Trova File (Home)" },
    },
    config = function()
      -- --- CONFIGURAZIONE FZF (FLUTTUANTE) ---
      -- Traduzione esatta del tuo let g:fzf_layout
      vim.g.fzf_layout = { 
        window = { width = 0.9, height = 0.6, border = 'rounded' } 
      }

      -- Traduzione esatta del tuo let g:fzf_colors
      vim.g.fzf_colors = {
        ['fg']      = { 'fg', 'Normal' },
        ['bg']      = { 'bg', 'Normal' },
        ['hl']      = { 'fg', 'Comment' },
        ['fg+']     = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
        ['bg+']     = { 'bg', 'CursorLine', 'CursorColumn' },
        ['hl+']     = { 'fg', 'Statement' },
        ['info']    = { 'fg', 'PreProc' },
        ['border']  = { 'fg', 'Ignore' },
        ['prompt']  = { 'fg', 'Conditional' },
        ['pointer'] = { 'fg', 'Exception' },
        ['marker']  = { 'fg', 'Keyword' },
        ['spinner'] = { 'fg', 'Label' },
        ['header']  = { 'fg', 'Comment' }
      }
    end
  }
}
