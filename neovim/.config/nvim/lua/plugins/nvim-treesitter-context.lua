return {
  'nvim-treesitter/nvim-treesitter-context',
  lazy = true,
  init = function()
    vim.api.nvim_set_hl(0, 'TreesitterContext', { fg = 'fg' })
  end,
}
