-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- map 88 to exit
vim.keymap.set({ "i", "v", "t", "n" }, "88", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

-- movement
vim.keymap.set({ "n", "v" }, "K", "5k", { noremap = true, desc = "Up faster" })
vim.keymap.set({ "n", "v" }, "J", "5j", { noremap = true, desc = "Down faster" })

-- buffer config
vim.keymap.set("n", "<leader>n", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>d", "<cmd>bd<cr>", { desc = "Delete buffer" })

-- splits config
vim.keymap.set("n", "<leader>th", "<C-w>s <cmd>term<cr>", { desc = "Term h split" })
vim.keymap.set("n", "<leader>tv", "<C-w>v <cmd>term<cr>", { desc = "Term v split" })
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Create v split" })
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Create h split" })
vim.keymap.set("n", "<leader>o", "<C-w>o", { desc = "Make fullpage buffer" })

-- tabs config
vim.keymap.set("n", "<leader>0", "<cmd>:tabc<cr>")

--others
