return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-neotest/neotest-python",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-python")({
                    python = "./env/bin/python",
                    pytest_discover_instances = true,
                })
            },
            output_panel = {
                open = 'botright vsplit | vertical resize 80'
            },
            summary = {
                open = 'botright vsplit | vertical resize 50'
            },
            discovery = {
                filter_dir = function(name, rel_path, root)
                    return name ~= "env"
                end,
            },
        })
        vim.keymap.set('n', '<leader>tr', function() neotest.run.run() end)
        vim.keymap.set('n', '<leader>ta', function() neotest.run.run(vim.fn.getcwd()) end)
        vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand("%")) end)
        vim.keymap.set('n', '<leader>ts', function() neotest.summary.toggle() end)
        vim.keymap.set('n', '<leader>td', function() neotest.output_panel.toggle() end)
    end
}
