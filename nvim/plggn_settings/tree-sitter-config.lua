require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
    disable = {'css', 'vim'},
  },
  indent = { enable = true, disable = {} },
}
