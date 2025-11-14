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
vim.g.maplocalleader = ','

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldcolumn = 'auto:3'
vim.opt.foldlevel = 10

vim.opt.wrap = false
vim.opt.colorcolumn = '80,120'
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.encoding = 'UTF-8'

vim.opt.updatetime = 50

vim.opt.completeopt = 'menu,menuone,preview,noselect,noinsert'

-- Disable mouse
vim.opt.mouse = ''

vim.opt.cursorline = true

require('config.lazy')

-- Colour Options

local colours = {
  high = '#dd95ad',
  medium = '#8d2e4d',
  low = '#251c1f',
  white = '#ffffff',
}
vim.cmd.colorscheme 'strawberry-dark'
vim.api.nvim_set_hl(0, 'Search', { bg = colours.medium, fg = colours.white })

vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none', fg = 'fg' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { link = 'StatusLine' })

vim.api.nvim_set_hl(0, 'Pmenu', { bg = colours.low })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = colours.medium })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = colours.medium, fg = colours.high })

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


vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})

vim.o.winborder = "rounded"

-- LSP Config

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = args.buf})

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { args.buf })
    end

    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
      vim.api.nvim_clear_autocmds { buffer = args.buf, group = "lsp_document_highlight" }
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = vim.lsp.buf.document_highlight,
        buffer = args.buf,
        group = "lsp_document_highlight",
        desc = "Document Highlight",
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        callback = vim.lsp.buf.clear_references,
        buffer = args.buf,
        group = "lsp_document_highlight",
        desc = "Clear All the References",
      })
      vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'Search' })
      vim.api.nvim_set_hl(0, 'LspReferenceText', { link = 'Search' })
      vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'Search' })
    end

    local opts = { noremap = true, silent = true, buffer = args.buf }

    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
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
  end,
})

vim.lsp.config('*', {
  root_markers = {
    '.git',
  },
})

vim.lsp.enable({
  'lua_ls',
  'ruby_lsp',
  'biome',
  'cssls',
  'herb_ls',
  'stylelint_lsp',
  'html',
  'emmet_ls',
  'ts_ls',
  'jsonls',
  'rust_analyzer',
  'tailwindcss',
  'taplo',
  'svelte',
  'terraformls',
  'tflint',
  'yamlls',
})
