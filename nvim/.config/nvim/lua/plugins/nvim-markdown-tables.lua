return {
  "donovanhubbard/markdown-tables.nvim",
  dir = "/Users/donovan/code/markdown-tables.nvim",
  name = "markdown-tables.nvim",
  lazy = false,
  priority = 5500,
  dev = {true},
  config = function ()
    require('markdown-tables')
  end,
  keys = {
    vim.keymap.set("v", "<leader>ft", ":FormatTable<CR>"),
  },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
}
