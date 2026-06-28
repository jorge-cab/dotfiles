require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        h = { "clang-format" },
        cmake = { "gersemi" },
        sql = { "sql_formatter" },
        mysql = { "sql_formatter" },
        plsql = { "sql_formatter" },
    },
    formatters = {
        prettier = {
            -- This ensures prettier only runs if a config file is found in the project's CWD
            require_cwd = true,
        },
        ["clang-format"] = {
            prepend_args = { "--style=file" },
        },
    },
    format_on_save = {
        lsp_fallback = true,
    },
})
