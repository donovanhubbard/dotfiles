return {
  "williamboman/mason-lspconfig.nvim",
  priority = 52,
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { 
        "lua_ls",
        "gopls",
      },
    }
  end,
  lazy = false
}
