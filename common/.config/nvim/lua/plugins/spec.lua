return {
    { "Shatur/neovim-ayu" },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate"
    },
    {
        'stevearc/conform.nvim',
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },
    {
        "ThePrimeagen/99",
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = "VeryLazy",
        config = function()
            require("bufferline").setup({
                options = {
                    diagnostics = "nvim_lsp",
                    show_buffer_close_icons = true,
                    show_close_icon = false,
                },
            })

            local map = vim.keymap.set
            map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
            map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
            map("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
            map("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
        end,
    }
}
