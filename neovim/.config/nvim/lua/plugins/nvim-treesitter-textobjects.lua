return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  opts = {
    select = {
      lookahead = true,
    },
    move = {
      set_jumps = true,
    },
  },
  init = function()
    vim.keymap.set({ "x", "o" }, "af", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "if", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "ac", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
    end)

    vim.keymap.set({ "x", "o" }, "ic", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
    end)

    vim.keymap.set("n", "<leader>a", function()
      require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
    end)

    vim.keymap.set("n", "<leader>A", function()
      require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
    end)
  end,
}
