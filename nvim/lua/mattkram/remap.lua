-- View the netrw directory tree thingy
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Scroll up and down by page and center the view
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Scroll the screen while also moving the cursor to stay in same location
vim.keymap.set("n", "<C-Y>", "<C-y>k")
vim.keymap.set("n", "<C-E>", "<C-e>j")

-- Search term stays in the center line
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Concatenate with next line but don't move the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Yank to the system clipboard (broken)
-- vim.keymap.set("v", "<leader>y", "\"*y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Disable quite with capital Q
vim.keymap.set("n", "Q", "<nop>")

-- TODO: When I start using tmux
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Start a replace pattern on the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
