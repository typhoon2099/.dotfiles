" Get Vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin()
  Plug 'editorconfig/editorconfig-vim'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/lsp_extensions.nvim'

  " Completion Stuff
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh6th/cmp-buffer'
  Plug 'hrsh7th/cmp-cmdline'

  " Svelte Stuff
  Plug 'evanleck/vim-svelte', {'branch': 'main'}

  " Rust Stuff
  Plug 'rust-lang/rust.vim'

  " Ruby Stuff
  Plug 'ngmy/vim-rubocop'

  " Colour Stuff
  Plug 'haystackandroid/strawberry'
call plug#end()

set completeopt=menu,menuone,noselect

lua <<EOF
-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local lspconfig = require'lspconfig'

  lspconfig.rust_analyzer.setup{
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  }

  lspconfig.solargraph.setup{
    capabilities = capabilities,
  }

  lspconfig.svelte.setup{}
EOF

" Colour Options
set background=dark
set termguicolors
colorscheme strawberry-dark

" Inlay hints for Rust
autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost,CursorHold *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint", "TypeHint", "ParameterHint"} }
