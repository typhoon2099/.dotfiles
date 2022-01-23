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


" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'

" Completion Stuff
"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh6th/cmp-buffer'

" Svelte Stuff
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Rust Stuff
Plug 'rust-lang/rust.vim'

" Ruby Stuff
Plug 'ngmy/vim-rubocop'

" Colour scheme
Plug 'haystackandroid/strawberry'

call plug#end()

" Completion options
set completeopt=menu,menuone,noselect

" Inlay hints for Rust
autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost,CursorHold *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint", "TypeHint", "ParameterHint"} }

" Colours
set background=dark
set termguicolors
colorscheme strawberry-dark
