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
let mapleader=" "

" Indentation
set tabstop=4 softtabstop=4
set shiftwidth=2
set expandtab
set smartindent
set shiftround

" Folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldcolumn=0
set foldlevel=10

set nowrap
set colorcolumn=80
set scrolloff=8
set signcolumn=yes
set encoding=UTF-8

set updatetime=50

" Enabled syntax highlighting
syntax enable
filetype plugin indent on

set completeopt=menu,menuone,preview,noselect,noinsert

" Disable mouse
set mouse=

set cursorline
