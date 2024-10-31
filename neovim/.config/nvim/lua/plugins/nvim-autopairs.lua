return {
  'windwp/nvim-autopairs',
  config = function()
    local npairs = require("nvim-autopairs")
    npairs.setup {}

    npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
  end,
}
