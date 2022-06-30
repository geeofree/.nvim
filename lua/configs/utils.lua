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

M.go_to_path = function (path)
	vim.api.nvim_command('Dirvish ' .. path)
	M.change_dir()
end

M.go_to_playground = function ()
	local playground_path = '/tmp/playground'
	local playground_exists = helpers.path_exists(playground_path)
	if playground_exists then
		M.go_to_path(playground_path)
	else
		local created, exit_code = os.execute("mkdir " .. playground_path)
		if created then
			M.go_to_path(playground_path)
		else
			print("Could not create playground path: ", exit_code)
		end
	end
end

return M
