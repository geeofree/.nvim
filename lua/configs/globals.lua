local M = {}
M.paths = { vim.api.nvim_exec('pwd', true) }
return M
