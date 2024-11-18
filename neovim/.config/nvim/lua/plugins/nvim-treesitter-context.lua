return {
  'nvim-treesitter/nvim-treesitter-context',
  lazy = true,
  config = function()
    require('treesitter-context').setup()
    vim.api.nvim_set_hl(0, 'TreesitterContext', { fg = 'fg' })
  end,
}
