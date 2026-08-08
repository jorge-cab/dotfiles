return {
    -- Command to start the language server
    cmd = { 'neocmakelsp', 'stdio' },

    -- Filetypes that should attach to this server
    filetypes = { 'cmake' },

    -- How to detect the project root
    root_markers = {
        'CMakeLists.txt',
        'build',
        '.git',
    },
}
