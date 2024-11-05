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

call plug#begin()
  Plug 'barrett-ruth/import-cost.nvim', { 'do': 'sh install.sh yarn' }

  " LSP
  Plug 'nvim-lua/lsp-status.nvim'

  " Terraform Stuff
  Plug 'hashivim/vim-terraform'

call plug#end()
]])

require('config.lazy')

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

require('config.markdown-preview')
require('import-cost').setup()

-- TODO: Set Search highlight
