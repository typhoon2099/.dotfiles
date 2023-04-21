local navic = require("nvim-navic")

local colors = {
  black        = '#282828',
  red          = '#dd6e6e',
  green        = '#8bde6f',
  blue         = '#6fb1de',
  yellow       = '#debd6f',
  pink         = '#dd95ad',
  brown        = '#251c1f',
  white        = '#ffffff',
}

local theme = {
  normal = {
    a = { bg = colors.pink, fg = colors.brown, gui = 'bold' },
    b = { bg = "#8D2E4D", fg = "#F1D2DC" },
    c = { bg = "default", fg = colors.pink },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
  },
  visual = {
    a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = 'bold' },
  },
  inactive = {
    a = { bg = colors.brown, fg = colors.pink, gui = 'bold' },
  }
}

require("lualine").setup({
  options = {
    theme = theme,
  },
  sections = {
    lualine_b = {
      'branch',
      {
        'diff',
        colored = false,
      }
    },
    lualine_c = {
      'filename',
      {
        function()
          return navic.get_location()
        end,
        cond = function()
          return navic.is_available()
        end
      },
    },
    lualine_x = { 'diagnostics' },
    lualine_y = { 'encoding', 'fileformat', 'filetype' },
    lualine_z = { 'location' }
  },
})
