return {
	'williamboman/mason.nvim',
	init = function() require("utils").lazy_load "mason.nvim" end,
	cmd = { "Mason" },

	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})

		local m_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
		if not m_lspconfig_ok then
			vim.notify('Problem with mason-lspconfig')
			return
		end

		mason_lspconfig.setup({
			unsure_installed = {
				'lua_ls', 'gopls',
			},
			automatic_installation = true,
		})
	end,
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
	},
	build = ":MasonUpdate"
}
