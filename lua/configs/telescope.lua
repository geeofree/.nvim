require('telescope').setup{
	defaults = {
		file_ignore_patterns = { "%.git", "node_modules", "%-lock.json" },
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
			theme = "ivy",
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
		buffers = {
			previewer = false,
			theme = "ivy",
      mappings = {
        i = {
          ["<c-d>"] = require('telescope.actions').delete_buffer
        }
      }
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
local helpers = require("configs.helpers")

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

M.search_work_dirs = function (opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "Working Directories",
		finder = finders.new_table {
			results = globals.paths
		},
		sorter = config.generic_sorter(opts),
		attach_mappings = function (prompt_bufnr, map)
			actions.select_default:replace(function ()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				local value = selection[1]
        require("configs.utils").go_to_path(value)
			end)
			map("i", "<c-d>", function()
				local selection = action_state.get_selected_entry()
				local found_work_dir = helpers.contains(globals.paths, selection[1])
				if found_work_dir ~= false then
					table.remove(globals.paths, found_work_dir)
				end
			end)
			return true
		end,
	}):find()
end

M.search_marked_buffers = function (opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "Marked Buffers",
		finder = finders.new_table {
			results = globals.marked_buffers
		},
		sorter = config.generic_sorter(opts),
		attach_mappings = function (_, map)
			map("i", "<c-d>", function()
				local selection = action_state.get_selected_entry()
				local found_marked_buffer = helpers.contains(globals.marked_buffers, selection[1])
				if found_marked_buffer ~= false then
					table.remove(globals.marked_buffers, found_marked_buffer)
				end
			end)
			return true
		end,
	}):find()
end

return M
