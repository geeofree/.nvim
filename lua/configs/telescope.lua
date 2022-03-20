require('telescope').setup{
	defaults = {
		path_display = {'smart'},
		mappings = {
			i = {
				["<c-k>"] = require('telescope.actions').move_selection_previous,
				["<c-j>"] = require('telescope.actions').move_selection_next,
				["<esc>"] = require('telescope.actions').close,
				["<c-n>"] = function()
					vim.cmd("stopinsert")
				end,
			}
		}
	},
  pickers = {
		find_files = {
			previewer = false,
		},
		buffer = {
			previewer = false,
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

return M
