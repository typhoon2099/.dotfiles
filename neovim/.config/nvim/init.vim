" Get Vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

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

lua require("config.fugitive")
lua require("config.gitsigns")
lua require("config.cellular-automaton")
lua require("config.cmp")
lua require("config.crates")
lua require("config.lspconfig")
lua require("config.lualine")
lua require("config.treesitter")
lua require("config.telescope")
lua require("config.nvim-autopairs")
lua require("config.markdown-preview")
lua require("config.silicon")
lua require("config.neotest")
lua require('import-cost').setup()
lua require('nvim-highlight-colors').setup {}

let g:mkdp_auto_close = 0
let g:mkdp_auto_start = 0
nmap <leader>mm <Plug>MarkdownPreviewToggle
set undofile

nnoremap <leader>bi :!bundle init<CR>
nnoremap <leader>bb :!bundle install<CR>
nnoremap <expr> <leader>ba ":!bundle add " .input("Add Gem: "). "<CR>"
nnoremap <expr> <leader>br ":!bundle remove " .input("Remove Gem: "). "<CR>"
