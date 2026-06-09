return {
  "https://plugins.svenxix.net/donovanhubbard/markdown-links.nvim.git",
  name = "markdown-links.nvim",
  ft = "markdown",
  priority = 5501,
  keys = {
    { "<CR>", ":FollowLink<CR>", mode = "n", silent = true },
    { "<BS>", ":BackLink<CR>", mode = "n", silent = true },
  }
}
