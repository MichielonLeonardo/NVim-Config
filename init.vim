set completeopt=noinsert,menuone,noselect
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=4
set tabstop=4

let mapleader = ","

inoremap 88 <ESC>
vnoremap 88 <ESC>
tnoremap 88 <C-\><C-n>

call plug#begin()

 Plug 'ryanoasis/vim-devicons'
 Plug 'preservim/nerdcommenter'
 Plug 'lervag/vimtex'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'vim-airline/vim-airline'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'jiangmiao/auto-pairs'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'turbio/bracey.vim'
 Plug 'tpope/vim-unimpaired'

call plug#end()

" vimtex configuration

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'

nnoremap <C-p> :FZF<CR>

" coc configuration

inoremap <silent><expr> <c-n>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"confirm ultisnips

let g:UltiSnipsExpandTrigger="<TAB>"

" Buffers

" list the buffers
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>l :Buffers<CR>

" delete the buffer
nnoremap <Leader>d :bd<CR>

" goes to next buffet
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :bN<CR>

nnoremap <Leader>th  <C-w>s :term<CR>
nnoremap <Leader>tv  <C-w>v :term<CR>
nnoremap <Leader>t   :term<CR> <C-w>o

"Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" make adjusting split sizes a bit more friendly
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" make split easier
nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" make the split full page
nnoremap <Leader>o <C-w>o

" change 2 split windows from vert to horiz and viceversa
nnoremap <Leader>rh <C-w>t<C-w>H
nnoremap <Leader>rk <C-w>t<C-w>K

" vim airline configuration

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='sol'
