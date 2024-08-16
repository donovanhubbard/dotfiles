return {
  "neovim/nvim-lspconfig",
  priority = 53,
  config = function()
    local lspconfig = require('lspconfig')

    -- lspconfig.gopls.setup {
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    --   cmd = {"gopls"},
    --   filetypes = { "go", "gomod", "gowork", "gotmpl" },
    --   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    --   settings = {
    --     gopls = {
    --       completeUnimported = true,
    --       usePlaceholders = true,
    --       analyses = {
    --         unusedparams = true,
    --       },
    --     },
    --   },
    -- }
    lspconfig.gopls.setup {}
    -- lspconfig.gopls.setup {
      -- cmd = { "gopls" },
    --   filetypes = { "go", "gomod", "gowork", "gotmpl" },
    --   -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    --   settings = {
    --     gopls = {
    --       completeUnimported = true,
    --       usePlaceholders = true,
    --       analyses = {
    --         unusedparams = true,
    --       },
    --     },
    --   },
    -- }
    -- lspconfig.lua_ls.setup {
    --   settings = {
    --     Lua = {
    --       diagnostics = {
    --         globals = {
    --           'vim',
    --           'describe',
    --           'it',
    --         },
    --       },
    --       -- completion = {
    --       --   callSnippet = "Replace"
    --       -- },
    --     },
    --   },
    -- }
    lspconfig.rust_analyzer.setup {}
  end,
  lazy = false
}
