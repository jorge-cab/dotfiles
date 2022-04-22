" Vim Plug
source $HOME/.config/nvim/plugins.vim

" NTree settings
luafile $HOME/.config/nvim/plggn_settings/tree_config_lua.lua
source $HOME/.config/nvim/plggn_settings/tree_config.vim

" Colorscheme settings
source $HOME/.config/nvim/plggn_settings/everforest_config.vim

" Status line
" source $HOME/.config/nvim/plggn_settings/airline_config.vim
luafile $HOME/.config/nvim/plggn_settings/lua-line-config.lua

" General Neovim settings
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim

" Lsp 
luafile $HOME/.config/nvim/plggn_settings/lsp-installer.lua


" Autocomplete settings
" Coq
" luafile $HOME/.config/nvim/plggn_settings/coq_config.lua
" Cmp
set completeopt=menu,menuone,noselect,noinsert
luafile $HOME/.config/nvim/plggn_settings/cmp_config.lua

" Fuzzy Finder
source $HOME/.config/nvim/plggn_settings/telescope_config.vim

" Autoclosing
luafile $HOME/.config/nvim/plggn_settings/auto-tag-config.lua
lua require('nvim-autopairs').setup{}

" Syntax
luafile $HOME/.config/nvim/plggn_settings/tree-sitter-config.lua

" Lorem
lua require'lorem-nvim'.setup()

" Buffer line
luafile $HOME/.config/nvim/plggn_settings/buffer-config.lua

