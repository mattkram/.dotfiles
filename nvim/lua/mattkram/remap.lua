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

-- Convenience wrappers for navigating split windows
vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })

-- Concatenate with next line but don't move the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Yank to the system clipboard (broken)
-- vim.keymap.set("v", "<leader>y", "\"*y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Disable quite with capital Q
vim.keymap.set("n", "Q", "<nop>")

-- Launch tmux-sessionizer from within Neovim
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Start a replace pattern on the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Function to toggle line numbers
local function toggle_line_numbers()
    if vim.wo.number or vim.wo.relativenumber then
        vim.wo.number = false
        vim.wo.relativenumber = false
        print("Line numbers disabled")
    else
        vim.wo.number = true
        vim.wo.relativenumber = true
        print("Line numbers enabled")
    end
end

-- Set the keymap to toggle line numbers
vim.keymap.set('n', '<A-n>', toggle_line_numbers, {
    desc = 'Toggle line numbers',
    silent = true
})
