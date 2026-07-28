return {
  -- Vimtex
  {
    "lervag/vimtex",
    lazy = false, -- È importante che Vimtex sia caricato subito all'avvio
    init = function()
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_mode = 0
      
      -- In Lua le liste usano le graffe {}, NON le quadre []
      vim.g.vimtex_indent_lists = {}
      
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_compiler_latexmk = {
        callback = 1, 
        continuous = 1, 
        executable = 'latexmk',
        -- Anche qui, le opzioni vanno nelle graffe {}
        options = {
          '-shell-escape', 
          '-verbose', 
          '-file-line-error', 
          '-synctex=1', 
          '-interaction=nonstopmode',
        }
      }
      
      -- Conceal
      vim.opt.conceallevel = 1
      vim.g.tex_conceal = 'abdmg'
    end,
  },

  -- UltiSnips
  {
    "SirVer/ultisnips",
    dependencies = { "honza/vim-snippets" },
    init = function()
      -- Array di percorsi in Lua: si usano le graffe {}
      vim.g.UltiSnipsSnippetDirectories = { '~/.config/nvim/UltiSnips', 'UltiSnips' }
      vim.g.UltiSnipsExpandTrigger = '<tab>'
      vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
      vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
      vim.g.UltiSnipsRemoveSelectModeMappings = 1
    end
  }
}
