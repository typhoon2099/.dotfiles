" Get Vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin()
  Plug 'editorconfig/editorconfig-vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/lsp_extensions.nvim'

  " Completion Stuff
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/cmp-vsnip'

  " Javascript Stuff
  Plug 'rajasegar/vim-pnpm'
  Plug 'evanleck/vim-svelte', {'branch': 'main'}

  " Rust Stuff
  Plug 'rust-lang/rust.vim'
  Plug 'Saecki/crates.nvim'

  " Ruby Stuff
  Plug 'ngmy/vim-rubocop'

  " Colour Stuff
  Plug 'haystackandroid/strawberry'

  " Git Stuff
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'

  " Testing Stuff
  Plug 'vim-test/vim-test'

  " Terraform Stuff
  Plug 'hashivim/vim-terraform'
call plug#end()

source ~/.config/nvim/telescope.vim
source ~/.config/nvim/fugitive.vim
source ~/.config/nvim/airline.vim

lua require("config.cmp")
lua require("config.lspconfig")

" Colour Options
colorscheme strawberry-dark

" Inlay hints for Rust
autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost,CursorHold *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "Comment", enabled = {"ChainingHint", "TypeHint", "ParameterHint"} }

" PNPM
map <space>pi :PnpmInstall<CR>
map <space>pt :PnpmTest<CR>

" Vim Test
source ~/.config/nvim/vim-test.vim
source ~/.config/nvim/vim-rubocop.vim
