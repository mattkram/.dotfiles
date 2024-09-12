return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = false,
            filesystem = {
                hijack_netrw_behavior = "open_current",
                filtered_items = {
                    visible = false,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = {
                        '.git',
                    },
                    never_show = {},
                },
            }
        })
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left toggle=true<CR>')
    end
}
