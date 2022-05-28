require('telescope').setup{
	defaults = {
		file_ignore_patterns = { "%.git" },
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

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local globals = require("configs.globals")

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

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "Dotfiles",
		cwd = "$pr/.dotfiles",
	})
end

M.search_dirs = function (opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "Working Directories",
		finder = finders.new_table {
			results = globals.paths
		},
		sorter = config.generic_sorter(opts),
		attach_mappings = function (prompt_bufnr)
			actions.select_default:replace(function ()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				local value = selection[1]
				vim.api.nvim_command(':Dirvish ' .. value)
				vim.api.nvim_command(':cd %:p:h')
			end)
			return true
		end,
	}):find()
end

return M
