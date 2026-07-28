local map = vim.keymap.set
-- Opzioni di default comuni per evitare di riscriverle
local opts = { noremap = true, silent = true }

-- =============================================================================
-- --- 1. MAPPATURE DI BASE E OVERRIDES ---
-- =============================================================================
-- Salto intelligente (utilissimo per LaTeX)
map('i', '<C-l>', '<C-o>a', opts)


-- Cancella la parola PRIMA del cursore (Ctrl + Backspace)
map('i', '<C-BS>', '<C-w>', opts)
map('i', '<C-h>', '<C-w>', opts)

-- =============================================================================
-- --- 2. NAVIGAZIONE FINESTRE, SPLIT E TABS ---
-- =============================================================================
-- Finestre base
map('n', '<leader>q', ':close<CR>', opts)
map('n', '<leader>d', ':bd<CR>', opts)
map('n', '<leader>c', ':Bclose<CR>', opts)
map('n', '<leader>=', '<C-w>=', opts)

-- Creazione Split
map('n', '<leader>wv', ':vsplit<CR>', opts)
map('n', '<leader>wh', ':split<CR>', opts)
map('n', '<leader>o', ':only<CR>', opts)

-- Navigazione Split
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize Split
map('n', '<C-Left>', ':vertical resize +3<CR>', opts)
map('n', '<C-Right>', ':vertical resize -3<CR>', opts)
map('n', '<C-Up>', ':resize +3<CR>', opts)
map('n', '<C-Down>', ':resize -3<CR>', opts)

-- Tabs
map('n', '<leader>ò', ':tabnew<CR>', opts)
map('n', '<leader>à', ':tabnext<CR>', opts)
map('n', '<leader>0', ':tabc<CR>', opts)

-- Terminale
map('n', '<leader>th', '<C-w>s :term<CR>', opts)
map('n', '<leader>tv', '<C-w>v :term<CR>', opts)
map('n', '<leader>tt', ':term<CR> <C-w>o', opts)

-- =============================================================================
-- --- 3. MOVIMENTI E SCORRIMENTO (ThePrimeagen Style) ---
-- =============================================================================
-- Navigazione Centrata
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Ricerca centrata
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Sposta blocchi in visual mode (Magia nera di Vim)
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)


-- =============================================================================
-- --- 4. BUFFER ---
-- =============================================================================
map('n', '<leader><leader>', '<C-^>', { noremap = true, silent = true, desc = 'Buffer alternato' })

-- =============================================================================
-- --- 5. I TUOI SCRIPT LUA (LATEX & MANIM) ---
-- =============================================================================
map('n', '<leader>lc', '<cmd>lua latex.focus_current()<CR>', opts)
map('n', '<leader>lp', '<cmd>lua latex.pick_chapter()<CR>', opts)
map('n', '<leader>la', '<cmd>lua latex.focus_all()<CR>', opts)
map('n', '<leader>ls', '<cmd>lua latex.pick_style()<CR>', opts)
map('n', '<leader>ii', '<cmd>lua latex.create_inkscape_drawing()<CR>', opts)
map('n', '<leader>ie', '<cmd>lua latex.edit_inkscape_drawing()<CR>', opts)
map('n', '<leader>is', '<cmd>lua latex.screenshot_to_latex()<CR>', opts)
map('n', '<leader>it', '<cmd>lua latex.image_to_tikz()<CR>', opts)
map('n', '<leader>mr', '<cmd>lua manim.manim_render_quick()<CR>', opts)

-- =============================================================================
-- --- 6. CONTROLLO ORTOGRAFICO ---
-- =============================================================================
map('i', '<C-d>', '<c-g>u<Esc>[s1z=`]a<c-g>u', opts)
map('n', '<leader>ss', ':set spell!<CR>', opts)
map('n', '<leader>si', ':set spelllang=it<CR>', opts)
map('n', '<leader>se', ':set spelllang=en<CR>', opts)

-- =============================================================================
-- --- 7. ALTRO (Completamento e Macro) ---
-- =============================================================================
-- L'espressione condizionale per premere Invio nel menu a tendina
map('i', '<CR>', 'pumvisible() ? "\\<C-y>" : "\\<CR>"', { expr = true, noremap = true })
