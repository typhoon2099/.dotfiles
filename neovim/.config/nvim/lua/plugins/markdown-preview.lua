return {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && yarn install',
  config = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 0
    vim.api.nvim_set_keymap('n', '<leader>mm', '<Plug>MarkdownPreviewToggle', { noremap = true, silent = true })
  end
}
