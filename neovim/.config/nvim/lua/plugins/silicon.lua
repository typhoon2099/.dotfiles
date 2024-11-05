return {
  'krivahtoo/silicon.nvim',
  build = './install.sh',
  config = function()
    require('silicon').setup({
      font = 'Hack Nerd Font Mono=24',
      theme = 'Monokai Extended',
      background = '#dd95ad',
    })
  end
}
