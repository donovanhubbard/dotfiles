return {
  "williamboman/mason.nvim",
  opts = {
  },
  config = function()
    require("mason").setup()
  end,
  priority = 51,
  lazy = false
}
