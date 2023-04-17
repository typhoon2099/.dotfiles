" Get Vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin()
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'tpope/vim-commentary'

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

  " Rust Stuff
  Plug 'rust-lang/rust.vim'
  Plug 'Saecki/crates.nvim'
  Plug 'simrat39/rust-tools.nvim'

  " Colour Stuff
  Plug 'bringsrain/strawberry'
  Plug 'brenoprata10/nvim-highlight-colors'

  " Git Stuff
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Testing Stuff
  Plug 'vim-test/vim-test'

  " Terraform Stuff
  Plug 'hashivim/vim-terraform'

  " Fun
  Plug 'Eandrju/cellular-automaton.nvim'
call plug#end()

" Colour Options
colorscheme strawberry-dark
highlight Normal guibg=none
highlight NonText guibg=none

source ~/.config/nvim/fugitive.vim
source ~/.config/nvim/gitgutter.vim

lua require("config.cellular-automaton")
lua require("config.cmp")
lua require("config.lspconfig")
lua require("config.lualine")
lua require("config.treesitter")
lua require("config.telescope")
lua require("config.nvim-autopairs")
lua require('import-cost').setup()
lua require('nvim-highlight-colors').setup {}

" Vim Test
source ~/.config/nvim/vim-test.vim
