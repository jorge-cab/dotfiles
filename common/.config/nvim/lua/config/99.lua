local _99 = require("99")

_99.setup({
    -- Use Claude Code as the AI backend
    provider = _99.Providers.ClaudeCodeProvider,
})

-- Core keybindings
vim.keymap.set("n", "<leader>9s", function()
    require("99").search()
end, { desc = "99: search project" })

vim.keymap.set("v", "<leader>9v", function()
    require("99").visual()
end, { desc = "99: replace visual selection" })

vim.keymap.set("n", "<leader>9x", function()
    require("99").stop_all_requests()
end, { desc = "99: stop all requests" })

-- Telescope pickers for switching model / provider
vim.keymap.set("n", "<leader>9m", function()
    require("99.extensions.telescope").select_model()
end, { desc = "99: select model" })

vim.keymap.set("n", "<leader>9p", function()
    require("99.extensions.telescope").select_provider()
end, { desc = "99: select provider" })
