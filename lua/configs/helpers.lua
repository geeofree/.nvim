local M = {}

M.contains = function (table, value)
	for index, item in pairs(table) do
		if item == value then return index end
	end
	return false
end

return M
