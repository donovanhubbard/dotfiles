return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 5000,
  opts = {},
  config = function()
    vim.cmd[[colorscheme tokyonight]]
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Number", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Macro", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Ignore", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Directory", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Identifier", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Question", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "WarningMsg", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "String", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Type", { bg = "NONE" })
  end,
}
