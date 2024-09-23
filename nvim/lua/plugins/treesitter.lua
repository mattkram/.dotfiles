return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        vim.filetype.add({
            filename = {
                ['Tiltfile'] = 'starlark',
            },
        })

        configs.setup({
            ensure_installed = {
                "c",
                "go",
                "html",
                "javascript",
                "lua",
                "python",
                "query",
                "starlark",
                "vim",
                "vimdoc",
            },
            auto_install = true,
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end
}
