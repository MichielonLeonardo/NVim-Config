-- ~/.config/nvim/lua/plugins/harpoon.lua

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,  -- salva le modifiche fatte nel menu
        sync_on_ui_close = true,
      },
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Aggiungi il file corrente in fondo alla lista
    map("n", "<leader>a", function()
      harpoon:list():add()
    end, vim.tbl_extend("force", opts, { desc = "Harpoon: marca file" }))

    -- Menu: qui puoi riordinare o cancellare come fosse un buffer normale
    map("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, vim.tbl_extend("force", opts, { desc = "Harpoon: menu" }))

    -- Salto diretto. Questi sono i tasti che userai il 95% del tempo.
    for i = 1, 5 do
      map("n", "<leader>" .. i, function()
        harpoon:list():select(i)
      end, vim.tbl_extend("force", opts, { desc = "Harpoon: file " .. i }))
    end

    map("n", "<leader>n", function() harpoon:list():next() end, opts)
    map("n", "<leader>N", function() harpoon:list():prev() end, opts)
  end,
}
