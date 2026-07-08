vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pr", ":Ex .<CR>")

-- Move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor when J
vim.keymap.set("n", "J", "mzJ`z")

-- Paste without changing buffer
vim.keymap.set("x", "p", "\"_dP")

-- yank into clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")


-- Replace curr word
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- LSP Diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Code actions (available fixes)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)

-- Copy diagnostic(s) on current line to system clipboard
vim.keymap.set("n", "<leader>ce", function()
    local line = vim.api.nvim_win_get_cursor(0)[1] - 1
    local diagnostics = vim.diagnostic.get(0, { lnum = line })
    if vim.tbl_isempty(diagnostics) then
        vim.notify("No diagnostics on this line", vim.log.levels.INFO)
        return
    end
    local file = vim.fn.expand("%:.")
    local messages = vim.tbl_map(function(d)
        return string.format("%s:%d:%d: %s", file, d.lnum + 1, d.col + 1, d.message)
    end, diagnostics)
    local text = table.concat(messages, "\n")
    vim.fn.setreg("+", text)
    vim.notify("Copied diagnostic to clipboard")
end)
