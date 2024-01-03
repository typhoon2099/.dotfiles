local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-jest")({
      jestCommand = "jest --watch"
    }),
    require("neotest-rspec"),
    require("neotest-rust"),
  },
})

local opts = { noremap = true }

vim.keymap.set('n', '<leader>tt', function() neotest.run.run() end, opts)
vim.keymap.set('n', '<leader>tl', function() neotest.run.run_last() end, opts)
vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand("%")) end, opts)
vim.keymap.set('n', '<leader>ta', function() neotest.run.attach() end, opts)
vim.keymap.set('n', '<leader>tw', function() neotest.watch.toggle() end, opts)
vim.keymap.set('n', '<leader>ts', function() neotest.summary.toggle() end, opts)
vim.keymap.set('n', '<leader>to', function() neotest.output.open() end, opts)
vim.keymap.set('n', '[t', function() neotest.jump.prev({ status = "failed" }) end, opts)
vim.keymap.set('n', ']t', function() neotest.jump.next({ status = "failed" }) end, opts)
