return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  keys = {
    {"<leader>ff", ":Telescope find_files<CR>", mode = "n"},
    {"<leader>fg", ":Telescope live_grep<CR>", mode = "n"},
    {"<leader>fb", ":Telescope buffers<CR>", mode = "n"},
  }
}
