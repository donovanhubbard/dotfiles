vim.api.nvim_set_hl(0, "MarkdownHeading", {
    fg = "#FCD765",
    bold = true,
})

vim.api.nvim_set_hl(0, "URL", {
    fg = "#65C7FC",
    italic = true,
})

local custom_highlighting_group = vim.api.nvim_create_augroup("CustomHighlighting", { clear = true })

vim.api.nvim_create_autocmd({'BufRead','BufNewFile', 'WinNew'}, {
  group = custom_highlighting_group,
  pattern = "*.md",
  callback = function()
    vim.fn.matchadd('URL', 'https://\\S\\+')
  end
})

vim.api.nvim_create_autocmd({'BufRead','BufNewFile', 'WinNew'}, {
  group = custom_highlighting_group,
  pattern = "*.md",
  callback = function()
    vim.fn.matchadd('MarkdownHeading', '^#.*$')
  end
})

