return {
  "donovanhubbard/markdown-tables.nvim",
  dir = "/Users/donovan/code/markdown-tables.nvim",
  name = "markdown-tables.nvim",
  ft = "markdown",
  priority = 5500,
  dev = {true},
  config = function ()
    require('markdown-tables')
  end,
  keys = {
    {"<leader>tm", ":CreateMarkdownTable<CR>", mode = "v", silent = true},
    {"<leader>tt", ":CreateTSVTable<CR>", mode = "v", silent = true},
    {"<leader>tc", ":CreateCSVTable<CR>", mode = "v", silent = true},
  },
}
