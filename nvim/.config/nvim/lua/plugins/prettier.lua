return {
  "prettier/vim-prettier",
  name = "prettier",
  priority = 1001,
  lazy = false,
  run = "yarn install",
  ft =  {"javascript", "typescript", "javascriptreact", "typescriptreact", "css", "less", "scss", "json", "graphql", "markdown", "yaml", "html", "lua"},
  config = function()
    vim.g["prettier#autoformat"] = 1
    vim.g["prettier#autoformat_require_pragma"] = 0
    vim.g["prettier#autoformat_config_options"] = {
      singleQuote = true,
      tabWidth = 2,
      trailingComma = "all",
    }
  end
}
