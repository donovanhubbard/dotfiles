vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("RustFmt", { clear = true }),
  pattern = "*.rs",
  callback = function()
    vim.cmd("RustFmt")
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("RustTabs", { clear = true }),
  pattern = "*.rs",
  callback = function()
    vim.opt.tabstop=4
    vim.opt.shiftwidth=4
    vim.opt.softtabstop=4
  end
})
