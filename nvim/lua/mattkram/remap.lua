-- View the netrw directory tree thingy
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Scroll up and down by page and center the view
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
