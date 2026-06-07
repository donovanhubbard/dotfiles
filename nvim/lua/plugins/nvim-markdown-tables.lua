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
    vim.keymap.set("v", "<leader>cm", ":CreateMarkdownTable<CR>"),
    vim.keymap.set("v", "<leader>ct", ":CreateTSVTable<CR>"),
    vim.keymap.set("v", "<leader>cc", ":CreateCSVTable<CR>"),
  },
}
