local lsp_installer = require("nvim-lsp-installer")

-- Include the servers you want to have installed by default below
local servers = {
	'tsserver',
	'cssls',
	'cssmodules_ls',
	'html',
	'jsonls',
	'tailwindcss',
	'vimls',
	'bashls',
	'sumneko_lua',
	'rust_analyzer',
	'yamlls',
	'quick_lint_js',
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local keyopts = { noremap=true, silent=true }
local on_attach = function(_, bufnr)
	-- Note: add in lsp client on-attach
	require "lsp_signature".on_attach()

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ge', '<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', keyopts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', keyopts)
end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = vim.loop.cwd, -- add this option so that we always attach to the client
		autostart = true,
	}

	if string.find(server.name, "lua") then
		opts.settings = {
			Lua = {
				diagnostics = { globals = {'vim'} }
			},
		}
	end

	if string.find(server.name, "eslint") then
		opts.settings = {
			["eslint.options"] = {
				rulePaths = { ".eslintrules" }
			}
		}
		print(opts.settings["eslint.options"].rulePaths[0])
	end

	server:setup(opts)
end)
