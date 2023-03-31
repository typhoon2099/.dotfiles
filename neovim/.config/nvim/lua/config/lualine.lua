local navic = require("nvim-navic")

require("lualine").setup({
  options = {
    theme = 'auto',
  },
    sections = {
        lualine_c = {
            {
              function()
                  return navic.get_location()
              end,
              cond = function()
                  return navic.is_available()
              end
            },
        },
    },
})
