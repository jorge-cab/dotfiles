return {
    -- Command to start the language server
    cmd = { 'clangd' },

    -- Filetypes that should attach to this server
    filetypes = { 'c', 'cpp', 'h' },

    -- How to detect the project root
    root_markers = {
        'compile_commands.json',
        'compile_flags.txt',
        'Makefile',
        '.git',
    },
}
