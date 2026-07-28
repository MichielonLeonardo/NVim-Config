local opt = vim.opt
local g = vim.g

-- Impostazione del Leader Key (deve essere caricato prima dei plugin)
g.mapleader = " "
g.maplocalleader = " "

-- Opzioni di base
opt.hidden = true
opt.mouse = 'a'
opt.number = true
opt.splitbelow = true
opt.splitright = true
opt.title = true
opt.ttimeoutlen = 0
opt.wildmenu = true
opt.clipboard = 'unnamedplus'
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.termguicolors = true
opt.scrolloff = 7
opt.spelllang = 'it' -- Predisposizione per lo spell checker

-- Impostazioni netrw (Explorer nativo)
g.netrw_banner = 0
g.netrw_winsize = 25
g.netrw_localcopydircmd = 'cp -r'

-- Rendere più veloce il tasto leader
opt.timeoutlen = 300      -- attesa più corta sulle sequenze con leader
opt.signcolumn = 'yes'    -- niente salti laterali quando appare un errore
opt.updatetime = 50       -- diagnostica e hover più reattivi
opt.showtabline = 0       -- bufferline non c'è più
