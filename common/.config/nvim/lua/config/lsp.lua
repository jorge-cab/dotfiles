vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('jdtls')
vim.lsp.enable('clangd')
vim.lsp.enable('sqls')
vim.lsp.enable('neocmake')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if not client then return end

        -- sqls' formatting is too opinionated; keep it for completion/hover only
        -- and let conform's lsp_fallback skip it on save.
        if client.name == 'sqls' then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end

        -- Go to definition
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = 'Go to definition' })

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
        require("conform").format({ bufnr = args.buf })
    end,
})

vim.diagnostic.config({
    virtual_text = {
        -- Prefix diagnostics with an icon
        prefix = '●',
        -- Only show diagnostics on the current line
        source = "if_many",
        -- Limit the width to prevent offscreen issues
        format = function(diagnostic)
            -- Truncate long messages
            local max_width = 80
            if #diagnostic.message > max_width then
                return diagnostic.message:sub(1, max_width) .. "..."
            end
            return diagnostic.message
        end,
    },
    -- Show signs in the sign column
    signs = true,
    -- Update diagnostics while typing
    update_in_insert = false,
    -- Sort diagnostics by severity
    severity_sort = true,
})
