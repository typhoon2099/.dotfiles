return {
  'brenoprata10/nvim-highlight-colors',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    render = 'virtual',
    virtual_symbol = '●',
    virtual_symbol_position = 'eol',
  },
}
