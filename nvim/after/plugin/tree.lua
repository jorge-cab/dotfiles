require("nvim-tree").setup()
vim.cmd('highlight NvimTreeNormal ctermbg=none guibg=none')

vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
