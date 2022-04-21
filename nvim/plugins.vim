" Plugins
call plug#begin('~/local/share/nvim/plugged')
	
  " Colorscheme
	Plug 'sainnhe/everforest'

  " Nvim Tree
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua' 

  " Lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'

  " Autocompletion
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

  "Syntax
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Status Line
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  Plug 'nvim-lualine/lualine.nvim'

  " Fuzzy Finder
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Autoclosing
  Plug 'windwp/nvim-ts-autotag'
  Plug 'windwp/nvim-autopairs'

  " Better Buffers
  Plug 'famiu/bufdelete.nvim'

  " Lorem
  Plug 'derektata/lorem.nvim'
  Plug 'vim-scripts/loremipsum'

  " Buffer Line
  Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
  
call plug#end()

