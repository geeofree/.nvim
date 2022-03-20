call plug#begin()
" Theme
Plug 'navarasu/onedark.nvim'

" Intellisense
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'ray-x/lsp_signature.nvim'

" Fuzzy Finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Emmet
Plug 'mattn/emmet-vim'

" Devicons
Plug 'kyazdani42/nvim-web-devicons'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" File Explorer
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'

" Line Commenting
Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
call plug#end()

colorscheme onedark

lua << EOF
require("configs.treesitter")
require("configs.lsp")
require("configs.cmp")
require("configs.telescope")
require("configs.devicons")
require('gitsigns').setup()
EOF
