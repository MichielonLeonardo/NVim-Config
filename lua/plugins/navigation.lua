return {
  -- Esploratore File Veloce (Oil)
  {
    "stevearc/oil.nvim",
    keys = {
      { "<leader>e", "<CMD>Oil<CR>", desc = "Apri cartella corrente in Oil" },
      { "-", "<CMD>Oil<CR>", desc = "Apri cartella genitore" }
    },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        view_options = { show_hidden = true },
      })
    end
  },

  -- Ricerca e Navigazione rapida (Flash)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = { modes = { search = { enabled = true } } },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
    config = function(_, opts)
      require("flash").setup(opts)
      -- Fix per netrw
      local netrw_flash_group = vim.api.nvim_create_augroup("NetrwFlash", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "netrw",
        group = netrw_flash_group,
        callback = function()
          vim.keymap.set("n", "s", function() require("flash").jump() end, { buffer = true, nowait = true, desc = "Flash in Netrw" })
          vim.keymap.set("n", "S", "s", { remap = true, buffer = true, nowait = true, desc = "Netrw Sort" })
        end,
      })
    end
  },

  -- File manager terminale (Yazi)
  {
    "mikavilpas/yazi.nvim",
    keys = {
      { "<leader>y", "<cmd>Yazi<CR>", desc = "Apri Yazi" },
      { "<leader>Y", "<cmd>Yazi cwd<CR>", desc = "Apri Yazi nella cwd" },
    },
    config = function()
      require("yazi").setup({
        open_for_directories = false,
        keymaps = {
          show_help = '<f1>',
          open_file_in_vertical_split = '<c-v>',
          open_file_in_horizontal_split = '<c-h>',
          open_file_in_tab = '<c-t>',
          grep_in_directory = '<c-g>',
        },
        floating_window_scaling_factor = 0.8,
        yazi_floating_window_winblend = 0,
      })
    end
  }
}
