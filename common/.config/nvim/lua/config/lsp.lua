vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then return end

        -- Autocomplete
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
            vim.keymap.set('i', '<M-Space>', function()
                vim.lsp.completion.get()
            end)
        end

        -- LSP Formatting
        -- if client:supports_method(vim.lsp.protocol.Methods.textDocument_formatting) then
        --     vim.api.nvim_create_autocmd('BufWritePre', {
        --         buffer = args.buf,
        --         callback = function()
        --             vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        --         end,
        --     })
        -- end

        -- LSP Formatting (only if conform won't handle it)
        -- if client:supports_method(vim.lsp.protocol.Methods.textDocument_formatting) then
        --     -- Check if conform has formatters for this buffer
        --     local conform = require("conform")
        --     local has_conform_formatter = #conform.list_formatters(args.buf) > 0
        --
        --     if not has_conform_formatter then
        --         vim.api.nvim_create_autocmd('BufWritePre', {
        --             buffer = args.buf,
        --             callback = function()
        --                 vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        --             end,
        --         })
        --     end
        -- end
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        print("conform")
        require("conform").format({ bufnr = args.buf })
    end,
})

-- Diagnostics
vim.diagnostic.config({
    -- Use the default configuration
    -- virtual_lines = true
    -- Alternatively, customize specific options
    virtual_lines = {
        -- Only show virtual line diagnostics for the current cursor line
        current_line = true,
    },
})
