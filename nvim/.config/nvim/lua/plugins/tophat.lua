return {
  "donovanhubbard/tophat",
  lazy = false,
  dir = "~/code/tophat",
  keys = {
    vim.keymap.set("v", "<leader>as", ":TopHatPrintSelected<CR>"),
    vim.keymap.set("v", "<leader>aa", ":TopHatWelcome<CR>"),
  },
}
