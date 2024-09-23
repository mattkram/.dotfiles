return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local telescope = require('telescope')
            telescope.setup {
                defaults = {
                    file_ignore_patterns = {
                        ".git/",
                        "env/",
                        "node_modules/",
                        "submodules/",
                    }
                },
                pickers = {
                    find_files = {
                        hidden = true
                    }
                }
            }
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            local telescope = require('telescope')
            -- First, we register the extension with telescope
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    }
                }
            })
            -- Now, we need to tell telescope to load the extension
            telescope.load_extension("ui-select")
        end
    }
}
