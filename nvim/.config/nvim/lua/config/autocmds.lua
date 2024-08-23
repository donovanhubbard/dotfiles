vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("RustFmt", { clear = true }),
  pattern = "*.rs",
  callback = function()
    vim.cmd("RustFmt")
  end
})
