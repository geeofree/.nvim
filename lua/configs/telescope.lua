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
		live_grep = {
			previewer = false,
		},
  },
	extensions = {},
}
