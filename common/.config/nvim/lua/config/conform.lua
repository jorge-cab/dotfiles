require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
    },
    formatters = {
        prettier = {
            -- This ensures prettier only runs if a config file is found in the project's CWD
            require_cwd = true,
        },
    },
    format_on_save = {
        lsp_fallback = true,
    },
})
