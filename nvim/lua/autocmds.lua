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

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("MarkdownFunctions", { clear = true }),
  pattern = "*.md",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', ':FollowLink<CR>', {silent=true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<BS>', ':BackLink<CR>', {silent=true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>h', ':FollowLinkSplit<CR>', {silent=true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>v', ':FollowLinkVSplit<CR>', {silent=true})
    vim.api.nvim_buf_set_keymap(0, 'v', '<leader>tm', ':CreateMarkdownTable<CR>', {silent=true})
    vim.api.nvim_buf_set_keymap(0, 'v', '<leader>tt', ':CreateTSVTable<CR>', {silent=true})
    vim.api.nvim_buf_set_keymap(0, 'v', '<leader>tc', ':CreateCSVTable<CR>', {silent=true})
  end
})
