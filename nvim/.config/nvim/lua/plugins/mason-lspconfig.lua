return {
  "williamboman/mason-lspconfig.nvim",
  priority = 52,
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { 
        "lua_ls",
        "gopls",
        "tsserver",
        "rust_analyzer",
      },
    }
  end,
  lazy = false
}
