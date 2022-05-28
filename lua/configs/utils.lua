local globals = require("configs.globals")

local M = {}

local function contains(table, value)
	for _, item in pairs(table) do
		if item == value then return true end
	end
	return false
end

M.change_dir = function ()
	vim.api.nvim_command(':cd %:p:h')
	local new_path = vim.api.nvim_exec('pwd', true)
	if not contains(globals.paths, new_path) then
		table.insert(globals.paths, new_path)
	end
end

return M
