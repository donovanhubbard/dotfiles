return {
  'eandrju/cellular-automaton.nvim',
  lazy = false,
  keys = {
    vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
  }
}
