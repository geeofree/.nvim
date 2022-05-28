local globals = require("configs.globals")
local helpers = require("configs.helpers")

local M = {}

M.change_dir = function ()
	vim.api.nvim_command(':cd %:p:h')
	local new_path = vim.api.nvim_exec('pwd', true)
	if not helpers.contains(globals.paths, new_path) then
		table.insert(globals.paths, new_path)
	end
end

M.mark_buffer = function ()
	local file = vim.api.nvim_exec("echo expand('%:t')", true)
	if file ~= '' then
		local new_marked_buffer = vim.api.nvim_exec('echo expand("%")', true)
		if not helpers.contains(globals.marked_buffers, new_marked_buffer) then
			table.insert(globals.marked_buffers, new_marked_buffer)
			print("Marked buffer: ", new_marked_buffer)
		end
	end
end

M.clear_marked_buffers = function ()
	globals.marked_buffers = {}
	print("Marked buffers cleared!")
end

return M
