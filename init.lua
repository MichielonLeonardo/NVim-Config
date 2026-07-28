-- ~/.config/nvim/init.lua


-- =============================================================================
-- 1. OPZIONI BASE E LEADER KEY
-- =============================================================================
-- Carichiamo prima di tutto le opzioni. È vitale che vim.g.mapleader 
-- venga letto prima di Lazy, altrimenti le scorciatoie dei plugin si rompono.
require("core.options")


-- =============================================================================
-- 2. GESTORE PLUGIN (LAZY.NVIM)
-- =============================================================================
-- Bootstrap: se lazy.nvim non è sul PC, lo scarica automaticamente
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Legge e carica tutti i file presenti in ~/.config/nvim/lua/plugins/
require("lazy").setup("plugins")


-- =============================================================================
-- 3. TASTI, EVENTI E SCRIPT CUSTOM
-- =============================================================================
-- Carichiamo le scorciatoie e gli autocmds dopo aver avviato i plugin
require("core.keymaps")
require("core.autocmds")

-- Rendiamo globali i tuoi script personalizzati, così che le scorciatoie 
-- in core/keymaps.lua possano chiamare `latex.focus_current()` ecc.
_G.latex = require("custom.latex_utils")
_G.manim = require("custom.manim_scripts")
