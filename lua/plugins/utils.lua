return {
  -- Parentesi automatiche
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "tex", "latex", "vim" },
      })
    end
  },

  -- Sessioni
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Scaricati", "/" },
        auto_restore_enabled = true,
        auto_save_enabled = true,
        auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
      })
    end
  },

  -- Menu aiuti (Which-key)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end
  }
}
