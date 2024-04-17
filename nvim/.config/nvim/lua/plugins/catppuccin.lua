return { 
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      transparent_background = true,
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
