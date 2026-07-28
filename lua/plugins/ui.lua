return {
  -- Colori e Tema
  {
    "AlphaTechnolog/pywal.nvim",
    name = "pywal",
    config = function()
      require('pywal').setup()
      vim.cmd('colorscheme pywal')

      -- I tuoi Tweak del contrasto per Pywal
      local function boost_pywal_contrast()
        local hl = vim.api.nvim_set_hl
        hl(0, "Keyword", { bold = true })
        hl(0, "Statement", { bold = true })
        hl(0, "Conditional", { bold = true })
        hl(0, "Repeat", { bold = true })
        hl(0, "Operator", { bold = true })
        hl(0, "Comment", { italic = true, fg = "#7a7a7a" })
        hl(0, "texSection", { bold = true, underline = true })
        hl(0, "texCmd", { bold = true })
        hl(0, "@text.title", { bold = true, underline = true })
        hl(0, "@function", { bold = true, italic = true })
        hl(0, "@variable.builtin", { italic = true })
      end

      boost_pywal_contrast()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = boost_pywal_contrast,
      })
    end
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = 'auto',
          component_separators = '',
          section_separators = { left = '', right = '' },
          globalstatus = true,
        },
        sections = {
          lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
          lualine_b = { { 'filename', path = 1, symbols = { modified = ' ●' } }, 'branch' },
          lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
        }
      })
    end
  }
}
