set nohidden
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set clipboard=unnamedplus

set expandtab
set shiftwidth=2
set tabstop=2

let mapleader = ","
let maplocalleader = ","

inoremap 88 <esc>
vnoremap 88 <esc>
tnoremap 88 <C-\><C-n>

" Salta oltre la parentesi/delimitatore successivo senza uscire dalla modalità Insert
inoremap <C-l> <C-o>a

" Oppure, un salto più intelligente che cerca la parentesi più vicina:
inoremap <C-f> <Esc>f)a


call plug#begin()

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'xiyaowong/transparent.nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'savq/melange-nvim'
Plug 'chrismccord/bclose.vim'
Plug 'tpope/vim-surround'
Plug 'KeitaNakamura/tex-conceal.vim'

call plug#end()

" vimtex configuration
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_indent_lists = []

let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'callback': 1,
    \ 'continuous': 1,
    \ 'executable': 'latexmk',
    \ 'options': [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
\ }

" conceal per LaTeX
set conceallevel=1
let g:tex_conceal='abdmg'

" ultisnips configuration
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" fuzzy finder
nnoremap <silent> <C-p> :Files<CR>

" Buffers
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>c :Bclose<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :bN<CR>

" Terminal
nnoremap <Leader>th  <C-w>s :term<CR>
nnoremap <Leader>tv  <C-w>v :term<CR>
nnoremap <Leader>t   :term<CR> <C-w>o

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Split resize
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Tabs
nnoremap <Leader>ò :tabnew<CR>
nnoremap <Leader>à :tabnext<CR>
nnoremap <Leader>0 :tabc<CR>

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='google_dark'

" colorscheme
set termguicolors
colorscheme melange

" Controllo ortografico italiano
setlocal spell
set spelllang=it

" Mappa per correggere parola sotto il cursore
inoremap <C-d> <c-g>u<Esc>[s1z=`]a<c-g>u

" Attiva/disattiva spelling
nnoremap <leader>ss :set spell!<CR>

" Cambia lingua spelling
nnoremap <leader>si :set spelllang=it<CR>
nnoremap <leader>se :set spelllang=en<CR>

" copilot spento di default
let g:copilot_enabled = 0

"impostazioni per reference di latex
"accettare la proposta con enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"far vedere le possibili reference con cntr-spazio
inoremap <C-Space> <C-x><C-o>


