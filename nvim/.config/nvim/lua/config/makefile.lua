vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("MakefileSpacing", { clear = true }),
  pattern = "Makefile",
  callback = function()
    vim.opt.tabstop=4
    vim.opt.shiftwidth=4
    vim.opt.softtabstop=4
    vim.opt.expandtab = false -- converts tabs to spaces
  end
})
