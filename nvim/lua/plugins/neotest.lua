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
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    python = "./env/bin/python",
                    pytest_discover_instances = true,
                })
            }
        })
        vim.keymap.set('n', '<leader>tr', function() require("neotest").run.run() end )
        vim.keymap.set('n', '<leader>tf', function() require("neotest").run.run(vim.fn.expand("%")) end )
        vim.keymap.set('n', '<leader>ts', function() require("neotest").summary.toggle() end )
        vim.keymap.set('n', '<leader>td', function() require("neotest").output_panel.toggle() end )

    end
}
