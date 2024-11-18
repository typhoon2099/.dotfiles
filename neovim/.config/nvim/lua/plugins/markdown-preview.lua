return {
  'iamcco/markdown-preview.nvim',
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = 'cd app && yarn install',
  keys = {
    { '<leader>mm', '<Plug>MarkdownPreviewToggle', desc = 'Toggle Markdown Preview' }
  },
  init = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_filetypes = { "markdown" }
  end
}
