return {
    -- Command to start the language server
    cmd = { 'sqls' },

    -- Filetypes that should attach to this server
    filetypes = { 'sql', 'mysql', 'plsql' },

    -- How to detect the project root
    root_markers = {
        'config.yml',
        '.git',
    },
}
