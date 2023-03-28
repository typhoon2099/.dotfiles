" Get Vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin()
  Plug 'editorconfig/editorconfig-vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-commentary'

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

  " Rust Stuff
  Plug 'rust-lang/rust.vim'
  Plug 'Saecki/crates.nvim'

  " Colour Stuff
  Plug 'bringsrain/strawberry'
  Plug 'ap/vim-css-color'

  " Git Stuff
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " Testing Stuff
  Plug 'vim-test/vim-test'

  " Terraform Stuff
  Plug 'hashivim/vim-terraform'

  Plug 'Eandrju/cellular-automaton.nvim'
call plug#end()

source ~/.config/nvim/fugitive.vim
source ~/.config/nvim/gitgutter.vim
source ~/.config/nvim/airline.vim

lua require("config.cellular-automaton")
lua require("config.cmp")
lua require("config.lspconfig")
lua require("config.treesitter")
lua require("config.telescope")
lua require('import-cost').setup()
lua require("config.nvim-autopairs")

" Colour Options
colorscheme strawberry-dark
highlight Normal guibg=none
highlight NonText guibg=none

" Vim Test
source ~/.config/nvim/vim-test.vim
