return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            -- Register Tiltfiles for formatting
            vim.filetype.add({
                filename = {
                    ['Tiltfile'] = 'starlark',
                },
                pattern = {
                    ['Tiltfile.*'] = 'starlark',
                },
            })

            -- Register .env files for formatting
            vim.filetype.add({
                pattern = {
                    ['%.env%-.*'] = 'sh',
                }
            })

            -- Register .env files for formatting
            vim.filetype.add({
                pattern = {
                    ['%.tmux%..*'] = 'bash',
                }
            })

            -- Automatically register template files marked as mustache format as helm
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "mustache" },
                callback = function()
                    if vim.fn.expand("%:e") == "tpl" then
                        vim.bo.filetype = "helm"
                    end
                end,
            })

            configs.setup({
                ensure_installed = {
                    "c",
                    "go",
                    "helm",
                    "html",
                    "javascript",
                    "lua",
                    "python",
                    "query",
                    "starlark",
                    "vim",
                    "vimdoc",
                    "yaml",
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
            vim.filetype.add({
                pattern = {
                    -- Specific patterns for Kubernetes
                    [".*/templates/.*%.yaml"] = "helm",
                    [".*/templates/.*%.yml"] = "helm",
                    [".*/templates/.*%.tpl"] = "helm",
                    -- Helm values files
                    [".*values.*%.yaml"] = "yaml.helm",
                }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    }
}
