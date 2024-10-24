local client = vim.lsp.start_client {
    name = "kramer-lsp",
    cmd = { "/Users/mattkram/poc/lsp/env/bin/lsp" }
}

if not client then
    vim.notify "failed to launch the client"
    return
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.lsp.buf_attach_client(0, client)
    end,
})
