vim.cmd([[
" Get Vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
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

call plug#begin()
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'tpope/vim-commentary'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  Plug 'krivahtoo/silicon.nvim', { 'do': './install.sh' }

  " LSP Document Symbols
  Plug 'MunifTanjim/nui.nvim'
  Plug 'SmiteshP/nvim-navbuddy'
  Plug 'SmiteshP/nvim-navic'

  " Status bar
  Plug 'nvim-lualine/lualine.nvim'

  Plug 'barrett-ruth/import-cost.nvim', { 'do': 'sh install.sh yarn' }

  " Telescope Stuff
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-symbols.nvim'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/lsp-status.nvim'

  " Completion Stuff
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'windwp/nvim-autopairs'
  Plug 'hrsh7th/cmp-emoji'
  Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'

  " Rust Stuff
  Plug 'rust-lang/rust.vim'
  Plug 'Saecki/crates.nvim'
  Plug 'simrat39/rust-tools.nvim'

  " Colour Stuff
  Plug 'bringsrain/strawberry'
  Plug 'brenoprata10/nvim-highlight-colors'

  " Git Stuff
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'tpope/vim-fugitive'

  " Testing Stuff
  Plug 'nvim-neotest/neotest'
  Plug 'nvim-neotest/nvim-nio'
  Plug 'nvim-neotest/neotest-jest'
  Plug 'olimorris/neotest-rspec'
  Plug 'rouge8/neotest-rust'
  Plug 'antoinemadec/FixCursorHold.nvim'

  " Terraform Stuff
  Plug 'hashivim/vim-terraform'

  " Fun
  Plug 'Eandrju/cellular-automaton.nvim'
call plug#end()

" Colour Options
colorscheme vim
colorscheme strawberry-dark
highlight NonText guibg=none
highlight! link CmpItemKindDefault Normal
highlight Normal guibg=none
]])

-- Bundler keymaps
vim.api.nvim_set_keymap('n', '<leader>bi', ':!bundle init<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>bb', ':!bundle install<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>ba', function()
  local gem_name = vim.fn.input("Add Gem: ")

  vim.cmd('!bundle add ' .. gem_name)
end, { noremap = true, silent = false })
vim.keymap.set('n', '<leader>br', function()
  local gem_name = vim.fn.input("Remove Gem: ")

  vim.cmd('!bundle remove ' .. gem_name)
end, { noremap = true, silent = false })

vim.opt.undofile = true

-- Load configs

require('config.fugitive')
require('config.gitsigns')
require('config.cellular-automaton')
require('config.cmp')
require('config.crates')
require('config.lspconfig')
require('config.lualine')
require('config.treesitter')
require('config.telescope')
require('config.nvim-autopairs')
require('config.markdown-preview')
require('config.silicon')
require('config.neotest')
require('import-cost').setup()
require('nvim-highlight-colors').setup {}
