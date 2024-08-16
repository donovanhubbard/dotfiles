return {
  "preservim/nerdtree",
  lazy = false,
  priority = 100,
  keys = {
    vim.keymap.set("n", "<leader>cc", ":NERDTreeToggle<CR>")
  }
}
