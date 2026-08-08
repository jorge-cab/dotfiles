-- nvim-treesitter `main` branch: no more `configs.setup`.
-- Parsers are installed explicitly, highlighting is started per-buffer.
require('nvim-treesitter').install({
    'bash', 'c', 'cmake', 'cpp', 'java', 'javascript', 'json', 'lua',
    'markdown', 'markdown_inline', 'python', 'query', 'sql', 'tsx',
    'typescript', 'vim', 'vimdoc',
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        -- ponytail: pcall instead of checking parser availability first --
        -- most filetypes have no parser and start() just errors.
        pcall(vim.treesitter.start, args.buf)
    end,
})
