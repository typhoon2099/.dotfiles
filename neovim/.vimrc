"set termguicolors
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

" TODO: Some of this stuff needs to go into NeoVim init
call plug#begin()
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
"Plug 'vim-syntastic/syntastic'

" LSP
Plug 'neovim/nvim-lspconfig'

" Completion Stuff
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh6th/cmp-buffer'

" Rust Stuff
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

" Svelte Stuff
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Ruby Stuff
Plug 'ngmy/vim-rubocop'
call plug#end()

" Completion options
set completeopt=menu,menuone,noselect
