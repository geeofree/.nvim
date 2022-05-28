local M = {}
M.paths = { vim.api.nvim_exec('pwd', true) }
M.marked_buffers = {}
return M
