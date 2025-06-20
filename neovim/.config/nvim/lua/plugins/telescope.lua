return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  init = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>fr', builtin.resume, {})

    vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
    vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
    vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
    vim.keymap.set('n', '<leader>gbc', builtin.git_bcommits, {})
    vim.keymap.set('n', '<leader>gg', builtin.builtin, {})
    vim.keymap.set('n', '<leader>gr', builtin.registers, {})

    vim.keymap.set('n', '<leader>ee', builtin.symbols, {})
  end,
  opts = {
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        additional_args = { "--hidden" },
      },
      buffers = {
        theme = 'dropdown',
        initial_mode = 'normal',
        mappings = {
          n = {
            ["d"] = "delete_buffer",
          },
        },
      },
    },
  },
}
