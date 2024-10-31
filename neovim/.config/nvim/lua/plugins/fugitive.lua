return {
  'tpope/vim-fugitive',
  config = function()
    local opts = { noremap = true }

    vim.keymap.set('n', '<leader>g', '<cmd>:G<cr>', opts)
    vim.keymap.set('n', '<leader>cc', '<cmd>:G commit<cr>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>:G commit --amend<cr>', opts)
    vim.keymap.set('n', '<leader>ce', '<cmd>:G commit --amend --no-edit<cr>', opts)
    vim.keymap.set('n', '<leader>pp', '<cmd>:G push<cr>', opts)
    vim.keymap.set('n', '<leader>ppt', '<cmd>:G push --tags<cr>', opts)
    vim.keymap.set('n', '<leader>ppf', '<cmd>:G push --force-with-lease<cr>', opts)
    vim.keymap.set('n', '<leader>gh', '<cmd>:G log %<cr>', opts)
    vim.keymap.set('n', '<leader>ghh', '<cmd>:G log -p %<cr>', opts)
    vim.keymap.set('n', '<leader>gbb', '<cmd>:G blame<cr>', opts)
  end,
}
