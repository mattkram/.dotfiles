vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Add regular and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable mouse click from setting cursor position (still allows scrolling)
vim.opt.mouse = ""

-- Scroll up and down by page and center the view
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
