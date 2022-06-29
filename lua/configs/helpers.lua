local M = {}

M.contains = function (table, value)
	for index, item in pairs(table) do
		if item == value then return index end
	end
	return false
end

M.path_exists = function (path)
	local ok, err, code = os.rename(path, path)
	if err then return false, err end
	if not ok then
		if code == 13 then return true end
	end
	return ok, err
end

return M
