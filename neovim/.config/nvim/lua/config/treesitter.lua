require'nvim-treesitter.configs'.setup {
  ensure_installed = { "ruby", "lua", "rust", "javascript", "html", "css", "svelte" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
