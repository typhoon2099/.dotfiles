"set termguicolors
set number
set relativenumber
set emoji
set tw=80
set list
set nohlsearch

" Tabs/Indentation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set nowrap
set colorcolumn=80
set scrolloff=8
set signcolumn=yes

set updatetime=50

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'rust-lang/rust.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'ngmy/vim-rubocop'
call plug#end()

