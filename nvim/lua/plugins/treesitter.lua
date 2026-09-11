return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- Register Tiltfiles for formatting
            vim.filetype.add({
                filename = {
                    ['Tiltfile'] = 'starlark',
                },
                pattern = {
                    ['Tiltfile.*'] = 'starlark',
                },
            })

            -- Register .condarc for formatting
            vim.filetype.add({
                filename = {
                    ['.condarc'] = 'yaml',
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

            vim.filetype.add({
                pattern = {
                    -- Specific patterns for Kubernetes
                    [".*/templates/.*%.yaml"] = "helm",
                    [".*/templates/.*%.yml"] = "helm",
                    [".*/templates/.*%.tpl"] = "helm",
                    -- Helm values files
                    [".*values.*%.yaml"] = "yaml.helm",
                    -- conda recipes
                    ['.*meta%.yaml'] = 'yaml.conda',
                }
            })

            local parsers = {
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
            }

            -- Install any missing parsers into the treesitter install dir
            local parser_dir = vim.fn.stdpath('data') .. '/site/parser'
            local missing = {}
            for _, lang in ipairs(parsers) do
                if vim.fn.filereadable(parser_dir .. '/' .. lang .. '.so') == 0 then
                    table.insert(missing, lang)
                end
            end
            if #missing > 0 then
                require('nvim-treesitter').install(missing):wait(300000)
            end

            -- Enable highlighting and indentation for the installed languages
            vim.api.nvim_create_autocmd("FileType", {
                pattern = parsers,
                callback = function()
                    local ok = pcall(vim.treesitter.start)
                    if ok then
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",

        config = function()
            require 'treesitter-context'.setup {
                enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
                multiwindow = false,      -- Enable multiwindow support.
                max_lines = 10,           -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20,     -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end
    }
}