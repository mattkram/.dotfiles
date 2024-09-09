-- Add regular and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable mouse click from setting cursor position (still allows scrolling)
vim.opt.mouse = ""
vim.opt.termguicolors = true

-- Four spaces is the only way
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Disable line wrap
vim.opt.wrap = false

-- Stores undo history in a file so it's retrievable for a long time
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

-- Disable highlighting of search results, but show while constructing
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Always have at least 8 lines at top or bottom while scrolling, except at end of line
vim.opt.scrolloff = 8

-- These are just blatantly copied from Prime
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- I'm drilling speed holes!
vim.opt.updatetime = 50

-- Draw a colored fill at the end of the line
vim.opt.colorcolumn = "88"

-- Set global keymapping leader to space
vim.g.mapleader = " "
