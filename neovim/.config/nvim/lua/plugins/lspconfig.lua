return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local lspconfig = require 'lspconfig'

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

    local on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr })
      end

      local opts = { noremap = true, silent = true, buffer = bufnr }

      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', 'grr', function()
        require('telescope.builtin').lsp_references();
      end, opts)
      vim.keymap.set({ 'n', 'v' }, 'ff', function() vim.lsp.buf.format { async = true } end, opts)
      vim.keymap.set('n', '<leader>cl', function() vim.lsp.codelens.run() end, opts)
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
          callback = vim.lsp.buf.document_highlight,
          buffer = bufnr,
          group = "lsp_document_highlight",
          desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
          callback = vim.lsp.buf.clear_references,
          buffer = bufnr,
          group = "lsp_document_highlight",
          desc = "Clear All the References",
        })
        vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'Search' })
        vim.api.nvim_set_hl(0, 'LspReferenceText', { link = 'Search' })
        vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'Search' })
      end
    end

    -- Lua
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }

    lspconfig.rust_analyzer.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          check = {
            allTargets = true,
            command = "clippy",
          },
          rustfmt = {
            rangeFormatting = {
              enable = true,
            },
          },
        },
      }
    }

    -- Ruby
    lspconfig.ruby_lsp.setup {
      filetypes = {
        "ruby",
        "eruby",
      },
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- HTML/CSS/JS
    lspconfig.biome.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    lspconfig.cssls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    lspconfig.eslint.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lspconfig.stylelint_lsp.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lspconfig.html.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    lspconfig.emmet_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lspconfig.ts_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
    lspconfig.jsonls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })


    -- TODO: Stylelint
    lspconfig.tailwindcss.setup {}

    lspconfig.taplo.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- Svelte
    lspconfig.svelte.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- Terraform
    lspconfig.terraformls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    lspconfig.tflint.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- YAML
    lspconfig.yamlls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        yaml = {
          format = {
            enable = true,
          },
        },
      },
    }
  end,
}
