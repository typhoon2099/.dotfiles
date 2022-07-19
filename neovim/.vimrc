set background=dark
set termguicolors
set number
set relativenumber
set emoji
set tw=80
set list
set nohlsearch
set hidden
set noswapfile

" Indentation
set tabstop=4 softtabstop=4
set shiftwidth=2
set expandtab
set smartindent
set shiftround

set nowrap
set colorcolumn=80
set scrolloff=8
set signcolumn=yes
set encoding=UTF-8

set updatetime=50

" Enabled syntax highlighting
syntax enable
filetype plugin indent on

set completeopt=menu,menuone,preview,noselect

" Tab through buffers
nmap <silent> <tab> :bnext<cr>
nmap <silent> <S-tab> :bprevious<cr>

" Tab to indent in visual select
vmap <silent> <tab> >
vmap <silent> <S-tab> <
