return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = {
      primary    = '#dd95ad',
      secondary  = '#8d2e4d',
      black      = '#3f3136',
      red        = '#de6f6f',
      green      = '#83de6f',
      blue       = '#6facde',
      yellow     = '#decf6f',
      background = '#251c1f',
      lightpink  = '#f1d2dc',
      white      = '#ffffff',
      grey       = '#c9abb5',
      darkgrey   = '#412931',
    }

    local theme = {
      normal = {
        a = { bg = colors.primary, fg = colors.background, gui = 'bold' },
        b = { bg = colors.secondary, fg = colors.lightpink },
        c = { fg = colors.primary },
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
        a = { bg = colors.grey, fg = colors.black, gui = 'bold' },
        b = { bg = colors.darkgrey, fg = colors.lightpink },
        c = { fg = colors.grey },
      }
    }

    local sections = {
      lualine_b = {
        'branch',
        {
          'diff',
          colored = false,
        }
      },
      lualine_c = {
        'filename',
      },
      lualine_x = { 'diagnostics' },
      lualine_y = { 'encoding', 'fileformat', 'filetype' },
      lualine_z = { 'location' }
    }

    require("lualine").setup({
      options = {
        theme = theme,
      },
      sections = sections,
      inactive_sections = sections,
    })
  end,
}
