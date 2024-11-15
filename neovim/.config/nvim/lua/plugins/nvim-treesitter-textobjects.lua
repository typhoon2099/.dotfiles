return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  config = function()
    require 'nvim-treesitter.configs'.setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>t"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>T"] = "@parameter.inner",
          },
        },
      },
    }
  end,
}
