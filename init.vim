call plug#begin()
" Theme
Plug 'navarasu/onedark.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Intellisense + Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'ray-x/lsp_signature.nvim'
Plug 'svermeulen/vimpeccable'
Plug 'elkowar/yuck.vim'

" Fuzzy Finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Emmet
Plug 'mattn/emmet-vim'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Line Commenting
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Float term
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Notes
Plug 'vimwiki/vimwiki'

" Navigation
Plug 'tpope/vim-unimpaired'

" Smear
Plug 'sphamba/smear-cursor.nvim'

" Indent Line
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

colorscheme kanagawa
hi Normal guibg=None ctermbg=None
hi EndOfBuffer guibg=None ctermbg=None
hi ColorColumn guibg=None ctermbg=None
hi SignColumn guibg=None ctermbg=None
hi LineNr guibg=None ctermbg=None
hi WinSeparator guibg=None ctermbg=None
hi TelescopeBorder guibg=None ctermbg=None

lua << EOF
require('prettier').setup()
require('neoscroll').setup()
require('gitsigns').setup()
require("configs.prettier")
require("configs.treesitter")
require("configs.cmp")
require("configs.lsp")
require("configs.luasnip")
require("configs.telescope")
require("configs.devicons")
require("configs.lualine")
require("configs.comment")
require("configs.smear_cursor")
require("configs.indent_line")
require("treesitter-context").setup({
  multiline_threshold = 1,
})
EOF
