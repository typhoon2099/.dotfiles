return {
  'brenoprata10/nvim-highlight-colors',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('nvim-highlight-colors').setup({
      render = 'virtual',
      virtual_symbol = '●',
      virtual_symbol_position = 'eol',
    })
  end,
}
