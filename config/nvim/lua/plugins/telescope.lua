return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  keys = {
    vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>"),
    vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>"),
    vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>"),
  }
}
