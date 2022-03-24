require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				["<c-k>"] = require('telescope.actions').move_selection_previous,
				["<c-j>"] = require('telescope.actions').move_selection_next,
				["<esc>"] = require('telescope.actions').close,
				["<c-n>"] = function()
					vim.cmd("stopinsert")
				end,
			}
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim"
		},
	},
  pickers = {
		find_files = {
			previewer = false,
			theme = "dropdown",
		},
		grep_string = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
		git_status = {
			theme = "ivy",
		},
		buffer = {
			previewer = false,
			theme = "dropdown",
		},
  },
	extensions = {},
}
require('telescope').load_extension('fzf')

local M = {}

M.search_nvim = function()
	require("telescope.builtin").find_files({
		prompt_title = ".nvim",
		cwd = "$pr/.nvim",
	})
end

M.search_notes = function()
	require("telescope.builtin").find_files({
		prompt_title = "Notes",
		cwd = "/var/tmp/notes",
	})
end

return M
