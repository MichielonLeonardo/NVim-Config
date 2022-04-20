set tabstop=4
:set shiftwidth=4
:set expandtab
set number
set relativenumber
set mouse=a
set cindent
set splitright
set splitbelow
:set hidden
set smartindent
set autoindent
set sidescrolloff=6
set noswapfile
set wildignore

inoremap ii <esc>
vnoremap ii <esc>
tnoremap <Esc> <C-\><C-n><CR>
tnoremap ii  <C-\><C-n><CR>

call plug#begin('~/.vim/plugged')

Plug 'tribela/vim-transparent'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'bagrat/vim-buffet'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'ianks/vim-tsx'
Plug 'rakr/vim-one'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-css', 'coc-react-refactor', 'coc-tsserver', 'coc-tailwindcss', 'coc-highlight', 'coc-prettier', 'coc-tslint', 'coc-emmet']

call plug#end()

nmap <C-b> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>
nnoremap qq :w\|bd<cr>

" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
nnoremap <a-n> :vnew term://bash <cr>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

set termguicolors
colorscheme one
