return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-vsnip',
    'windwp/nvim-autopairs',
    'hrsh7th/cmp-emoji',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'brenoprata10/nvim-highlight-colors',
  },
  config = function()
    local cmp = require 'cmp'

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'vsnip' },
        { name = "crates" },
        { name = 'path', option = { trailing_slash = false } },
        { name = "emoji" },
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        format = require('nvim-highlight-colors').format,
      },
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline({}),
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
      }, {
        { name = 'buffer' },
      })
    })


    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline({}),
      sources = cmp.config.sources({
        { name = 'path', option = { trailing_slash = false } }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
}
