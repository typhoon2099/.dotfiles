return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy   = false,
  build  = ':TSUpdate',
  opts   = {
    ensure_installed = {
      "ruby",
      "lua",
      "rust",
      "javascript",
      "html",
      "css",
      "svelte",
      "monkeyc",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  }
}
