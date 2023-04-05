local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require'lspconfig'
local navbuddy = require("nvim-navbuddy")
navbuddy.setup({
  lsp = {
    auto_attach = true
  }
})
local navic = require("nvim-navic")

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
    vim.keymap.set('n', '<leader>nn', navbuddy.open, opts)
  end

  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', function()
    require('telescope.builtin').lsp_references();
  end, opts)
  vim.keymap.set("n", 'ff', function() vim.lsp.buf.format { async = true } end, opts)
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
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold cterm=reverse gui=reverse
      hi LspReferenceText cterm=bold cterm=reverse gui=reverse
      hi LspReferenceWrite cterm=bold cterm=reverse gui=reverse
    ]], false)
  end
end

-- Lua
lspconfig.lua_ls.setup{
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

-- Rust
lspconfig.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "rustup", "run", "nightly", "rust-analyzer" },
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}
require('crates').setup()

-- Ruby
lspconfig.solargraph.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- HTML/CSS/JS
lspconfig.cssls.setup{
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
lspconfig.html.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- TODO: Stylelint
-- TODO: Tailwind CSS

-- Svelte
lspconfig.svelte.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Terraform
lspconfig.terraformls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
lspconfig.tflint.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
