return {
    -- Command to start the language server
    cmd = { 'gopls' },

    -- Filetypes that should attach to this server
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },

    -- How to detect the project root
    -- Files that share a root_dir will share the same LSP instance
    root_markers = {
        'go.work',
        'go.mod',
        '.git',
    },

    -- Optional: basic settings for the server
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
}
