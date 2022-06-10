set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber
set mouse=a
set cindent
set splitright
set splitbelow
set hidden
set smartindent
set autoindent
set sidescrolloff=6
set noswapfile
set wildignore
set clipboard=unnamedplus


let mapleader=','
let maplocalleader="\,"
inoremap ii <esc>
vnoremap ii <esc>
tnoremap <Esc> <C-\><C-n><CR>
tnoremap ii  <C-\><C-n><CR>

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'Rigellute/rigel'
Plug 'honza/vim-snippets'
Plug 'matze/vim-tex-fold'
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround' 
Plug 'Chiel92/vim-autoformat'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-gitgutter'
Plug 'tribela/vim-transparent'
Plug 'glepnir/dashboard-nvim'
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
let g:javascript_plugin_flow = 1

let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'

nmap <C-b> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

nnoremap <A-i> :LLPStartPreview<cr>
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let NERDTreeShowHidden=1

let g:dashboard_default_executive = 'fzf'

let g:dashboard_custom_header =[
  \'                 ▄████████▄         ',
  \'               ▄█▀▒▒▒▒▒▒▒▀██▄       ',
  \'           ▄█▀▒▒▒▒▒▒▄▒▒▒▒▒▒▐█▌      ',
  \'         ▄█▒▒▒▒▒▒▒▒▒▒▀█▒▒▒▄██       ',
  \'       ▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▀▒▒▒█▄     ',
  \'     ▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▄   ',
  \'     ▄█▒▒▒▄██████▄▒▒▒▒▄█████▄▒▒▒▒█  ',
  \'     █▒▒▒█▀░░░░░▀█ ▒▒▒█▀░░░░▀█▒▒▒█  ',
  \'     █▒▒▒█░░▄░░░░▀████▀░░░▄░░█▒▒▒█  ',
  \'   ▄███▄▒█▄░▐▀▄░░░░░░░░░▄▀▌░▄█▒▒███▄',
  \'   █▀░░█▄▒█░▐▐▀▀▄▄▄ ▄▄▄▀▀▌▌░█▒▒█░░▀█',
  \'   █░░░░█▒█░▐▐  ▄▄ █ ▄▄  ▌▌░█▒█░░░░█',
  \'   █░▄░░█▒█░▐▐▄ ▀▀ █ ▀▀ ▄▌▌░█▒█░░▄░█',
  \'   █░░█░█▒█░░▌▄█▄▄▀ ▀▄▄█▄▐░░█▒█░█░░█',
  \'   █▄░█████████▀░░▀▄▀░░▀█████████░▄█',
  \'   ██▀░░▄▀░░▀░░▀▄░░░▄▀░░▀░░▀▄░░▀██  ',
  \'   ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██',
  \'   █░▄░░░░░░░░░░░░░░░░░░░░░░░░░░░▄░█',
  \'   █░▀█▄░░░░░░░░░░░░░░░░░░░░░░░▄█▀░█',
  \'   █░░█▀███████████████████████▀█░░█',
  \'   █░░█    █   █   █   █   █    █░░█',
  \'   █░░░▀█▄▄█▄▄▄█▄▄▄█▄▄▄█▄▄▄█▄▄█▀░░░█',
  \'   ▀█░░▀█▄█    █   █   █   █▄█▀░░░█▀  ',
  \'    ▀█░░░▀▀█▄▄ █   █   █▄▄█▀▀░░░░█▀  ',
  \'     ▀█░░░░░▀▀█████████▀▀░░░░░░█▀    ',
  \'      ▀█░░░░░░░▄░░░░░░░▄░░░░░░█▀    ',
  \'        ▀██▄░░░▀▀▀▀▀▀▀▀▀░░░▄██▀      ',
  \'          ▀██▄▄░░░░░░░▄▄██▀        ', 
  \'             ▀▀███████▀▀            ',
\]

set termguicolors
colorscheme rigel

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_method = 'zathura'
" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
    let g:tex_flavor='latex'
    let g:vimtex_quickfix_mode=0

"Completion settings
"Use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()

inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-pre',''])\<CR>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

