return {
    -- Command to start the language server
    cmd = { 'typescript-language-server', '--stdio' },

    -- Filetypes that should attach to this server
    filetypes = {
        'typescript',
        'typescriptreact',
        'typescript.tsx',
        'javascript',
        'javascriptreact',
        'javascript.jsx',
    },

    -- How to detect the project root
    -- Files that share a root_dir will share the same LSP instance
    root_markers = {
        { 'tsconfig.json', 'jsconfig.json' }, -- equal-priority group
        'package.json',
        '.git',
    },

    -- Optional: basic settings for the server
    settings = {
        typescript = {
            format = {
                semicolons = 'insert',
            },
        },
    },

    -- Enable single-file support (no root markers found)
    single_file_support = true,
}
