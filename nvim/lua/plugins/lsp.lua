return {
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        opts = {
            formatters_by_ft = {
                javascript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescript = { 'prettier' },
                typescriptreact = { 'prettier' },
                html = { 'prettier' },
                htmldjango = { 'prettier' },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
    {
        'mfussenegger/nvim-lint',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local lint = require('lint')
            lint.linters_by_ft = {
                javascript = { 'eslint' },
                javascriptreact = { 'eslint' },
                typescript = { 'eslint' },
                typescriptreact = { 'eslint' },
            }

            -- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            --     callback = function()
            --         require('lint').try_lint()
            --     end,
            -- })
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "zapling/mason-lock.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lock").setup({
                lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json" -- (default)
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "jedi_language_server",
                    "lua_ls",
                    "ruff",
                    "rust_analyzer",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
        },
        config = function()
            local lspconfig = require('lspconfig')

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig.util.default_config.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            -- Executes the callback function every time a
            -- language server is attached to a buffer.
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "x" }, "<leader>fc", function() vim.lsp.buf.format({ async = true }) end, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>fa",
                        function() vim.lsp.buf.code_action({ async = true, apply = true }) end, opts)
                end,
            })

            -- Add configuration for the individual language servers
            vim.lsp.enable('jedi_language_server')
            vim.lsp.enable('gopls')
            vim.lsp.enable('lua_ls')
            vim.lsp.enable('ruff')
            vim.lsp.enable('rust_analyzer')
            vim.lsp.enable('tflint')
            vim.lsp.enable('terraformls')
            vim.lsp.enable('ts_ls')

            -- Autocompletion setup
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({}),
            })
        end
    },
}
