require'nvim-treesitter.configs'.setup {
  ensure_installed = { "ruby", "lua", "rust", "javascript", "html", "css", "svelte" },
  sync_install = false,
  auto_install = true,
}
