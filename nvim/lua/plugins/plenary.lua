return {
  'nvim-lua/plenary.nvim',
  lazy = false,
  keys = {
    vim.keymap.set("n", "<leader>tt", ":PlenaryBustedFile %<CR>"),
  }
}
