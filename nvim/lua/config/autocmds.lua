vim.api.nvim_set_hl(0, "JustYanked", { fg = "#000000", bg="#ffffff" })

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    pcall(vim.hl.on_yank, {
      higroup = "JustYanked",
      timeout = 300,
    })
  end
})

-- Go autocmds
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.cmd('GoFmt')
  end,
  group = format_sync_grp,
})

-- Rust autocmds
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

