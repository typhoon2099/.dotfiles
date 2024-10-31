vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.emoji = true
vim.opt.tw = 80
vim.opt.list = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.swapfile = false
vim.g.mapleader = ' '

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldcolumn = 'auto:3'
vim.opt.foldlevel = 10

vim.opt.wrap = false
vim.opt.colorcolumn = '80'
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.encoding = 'UTF-8'

vim.opt.updatetime = 50

vim.opt.completeopt = 'menu,menuone,preview,noselect,noinsert'

-- Disable mouse
vim.opt.mouse = ''

vim.opt.cursorline = true

vim.cmd([[
" Get Vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

" Enabled syntax highlighting
syntax enable
filetype plugin indent on

call plug#begin()
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

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/lsp-status.nvim'

  " Colour Stuff
  Plug 'bringsrain/strawberry'
  Plug 'brenoprata10/nvim-highlight-colors'

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
]])

-- Colour Options
vim.cmd.colorscheme 'strawberry-dark'
vim.api.nvim_set_hl(0, 'CmpItemKindDefault', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'Normal', { fg = 'fg', bg = 'none' })
vim.api.nvim_set_hl(0, 'Search', { bg = '#8d2e4d', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none', fg = 'fg' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none', fg = 'fg' })

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

require('config.lazy')
require('config.cellular-automaton')
require('config.lspconfig')
require('config.lualine')
require('config.treesitter')
require('config.nvim-autopairs')
require('config.markdown-preview')
require('config.silicon')
require('config.neotest')
require('import-cost').setup()
require('nvim-highlight-colors').setup {}

-- TODO: Set Search highlight
