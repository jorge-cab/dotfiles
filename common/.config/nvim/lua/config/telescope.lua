require('telescope').setup({
    defaults = {
        -- Search hidden files but still respect .gitignore
        file_ignore_patterns = { "^.git/" },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function()
                return { "--hidden", "--glob", "!.git/*" }
            end,
        },
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
