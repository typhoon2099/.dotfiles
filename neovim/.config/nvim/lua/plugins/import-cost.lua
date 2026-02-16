return {
  'barrett-ruth/import-cost.nvim',
  ft = {
    'javascript',
    'javascriptreact'
  },
  config = false,
  init = function()
    vim.g.import_cost = {
      package_manager = 'yarn',
    }
  end,
}
