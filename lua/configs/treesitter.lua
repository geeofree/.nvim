require'nvim-treesitter.configs'.setup {
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = "all",

	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = false,

	highlight = {
		enable = true,
	},

	indent = {
		enable = true
	},

	context_commentstring = {
		enable = true,
	}
}
