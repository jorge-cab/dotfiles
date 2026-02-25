-- Get the home directory
local home = os.getenv('HOME')

-- jdtls requires a workspace directory
-- We'll use a dedicated directory for each project
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.local/share/jdtls/workspace/' .. project_name

return {
    -- Command to start the language server
    -- Assumes jdtls is installed via package manager (e.g., pacman -S jdtls on Arch)
    -- or manually and available in PATH
    cmd = {
        'jdtls',
        '-data', workspace_dir,
    },

    -- Filetypes that should attach to this server
    filetypes = { 'java' },

    -- How to detect the project root
    -- Files that share a root_dir will share the same LSP instance
    root_markers = {
        { 'pom.xml', 'build.gradle', 'build.gradle.kts' }, -- Maven or Gradle projects
        { '.git', 'gradlew', 'mvnw' },
    },

    -- Enable single-file support (no root markers found)
    single_file_support = true,

    -- Optional: basic settings for the server
    settings = {
        java = {
            -- Enable/disable the 'auto build' feature
            autobuild = { enabled = true },
            -- Specify the formatting preferences
            format = {
                enabled = true,
                settings = {
                    -- Use Eclipse formatter by default
                    -- You can customize this by pointing to a formatter XML file
                    -- url = home .. "/.config/nvim/lsp/java-formatter.xml",
                },
            },
            -- Configure code generation settings
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                },
                useBlocks = true,
            },
            -- Configure completion settings
            completion = {
                favoriteStaticMembers = {
                    "org.junit.jupiter.api.Assertions.*",
                    "org.junit.Assert.*",
                    "org.mockito.Mockito.*",
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                },
            },
            -- Maven settings
            maven = {
                downloadSources = true,
            },
            -- Java runtime configuration
            configuration = {
                runtimes = {
                    -- Add your Java runtimes here if needed
                    -- Example:
                    -- {
                    --     name = "JavaSE-17",
                    --     path = "/usr/lib/jvm/java-17-openjdk",
                    -- },
                }
            },
        },
    },
}
