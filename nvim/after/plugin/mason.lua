require("mason").setup({
  max_concurrent_installers = 10,
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "astro",
    "biome",
    "bashls",
    "cssls",
    "css_variables",
    "cssmodules_ls",
    "dockerls",
    "graphql",
    "html",
    "jsonls",
    "lua_ls",
    "prismals",
    "rust_analyzer",
    "somesass_ls",
    "svelte",
    "tailwindcss",
    "tsserver",
    "vimls",
    "wgsl_analyzer",
    "yamlls",
    "zls",
  },
  automatic_installation = true,
})
