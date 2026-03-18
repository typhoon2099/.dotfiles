return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy   = false,
  build  = ':TSUpdate',
  init   = function()
    require('nvim-treesitter').install({
      "bash",
      "dockerfile",
      "html",
      "json",
      "jsx",
      "markdown",
      "python",
      "scss",
      "sql",
      "typescript",
      "vim",
      "xml",
      "yaml",
      "ruby",
      "lua",
      "rust",
      "javascript",
      "html",
      "css",
      "svelte",
      "embedded_template",
    })

    vim.api.nvim_create_autocmd("Filetype", {
      pattern = {
        "bash",
        "dockerfile",
        "html",
        "json",
        "javascriptreact",
        "markdown",
        "python",
        "scss",
        "sql",
        "typescript",
        "vim",
        "xml",
        "yaml",
        "ruby",
        "lua",
        "rust",
        "javascript",
        "html",
        "css",
        "svelte",
        "eruby",
      },
      callback = function()
        vim.treesitter.start()
        vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.opt.foldmethod = 'expr'
      end,
    })
  end
}
