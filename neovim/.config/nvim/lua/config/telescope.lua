local telescope = require("telescope")

telescope.setup({
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = { "--hidden" },
    },
  },
})

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})

vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gbc', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gg', builtin.builtin, {})
vim.keymap.set('n', '<leader>gr', builtin.registers, {})

vim.keymap.set('n', '<leader>grr', builtin.lsp_references, {})

vim.keymap.set('n', '<leader>ee', builtin.symbols, {})
