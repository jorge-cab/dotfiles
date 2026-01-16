vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()



    vim.keymap.set("n", "gC", [[:execute 'cd ' . b:netrw_curdir | pwd<CR>]], { silent = true })

    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})


