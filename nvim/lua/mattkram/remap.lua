vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Add regular and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Scroll up and down by page and center the view
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
