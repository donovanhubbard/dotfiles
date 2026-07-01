local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2 -- # of spaces in a tab
opt.shiftwidth = 2 -- # of spaces for each level of indentation
opt.softtabstop = 2 -- # of spaces is a tab in insert mode
opt.expandtab = true -- converts tabs to spaces
opt.smartindent = true -- allows auto indentation
opt.wrap = false -- do not wrap long lines

-- Search
opt.incsearch = true
opt.ignorecase = true -- ignore case on search
opt.smartcase = true -- if there is some casing in the search, be case sensitive

-- Appearance
opt.number = true
-- opt.relativenumber = true -- use relative line numbers
opt.termguicolors = true -- enables full color support in the terminal
opt.colorcolumn = '100'
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10 -- start vertical scrolling if within 10 lines of bottom of screen
opt.completeopt = "menuone,noinsert,noselect" -- something something autocomplete

-- Behavior
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.mouse:append('a')
opt.clipboard:append("unnamedplus")
opt.modifiable = true
-- opt.guicursor = 
opt.encoding = "UTF-8"


