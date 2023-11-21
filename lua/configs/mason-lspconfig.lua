require("mason-lspconfig").setup({
	ensure_installed = {},
})
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers

require("mason-lspconfig").setup_handlers({
	function(server)
		local opt = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		}
		require("lspconfig")[server].setup(opt)
	end,
})
