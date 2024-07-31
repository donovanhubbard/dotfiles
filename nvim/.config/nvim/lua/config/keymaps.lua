vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- local keymap = vim.keymap
-- Directory Navigation
-- keymap.set("n","<leader>m",":NvimTreeFocus<CR>", { noremap = true, silent = true })
-- keymap.set("n","<leader>f",":NvimTreeToggle<CR>", { noremap = true, silent = true })

local increment = 8

local function increaseWidth()
  local current = vim.api.nvim_win_get_width(0)
  vim.api.nvim_win_set_width(0, current + increment)
end
local function decreaseWidth()
  local current = vim.api.nvim_win_get_width(0)
  vim.api.nvim_win_set_width(0, current - increment)
end
local function increaseHeight()
  local current = vim.api.nvim_win_get_height(0)
  vim.api.nvim_win_set_height(0, current + increment)
end
local function decreaseHeight()
  local current = vim.api.nvim_win_get_height(0)
  vim.api.nvim_win_set_height(0, current - increment)
end

vim.keymap.set('n', '<leader>ww', increaseWidth)
vim.keymap.set('n', '<leader>wn', decreaseWidth)
vim.keymap.set('n', '<leader>wt', increaseHeight)
vim.keymap.set('n', '<leader>ws', decreaseHeight)
