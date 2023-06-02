require("mason-lspconfig").setup_handlers({
	function(server)
		ensure_installed = {
			-- "sumneko_lua",
			-- "pyright",
			-- "html",
			-- "texlab",
			-- "lua-language-server",
			-- "haskell-language-server",
			-- "black",
			-- "ltex-ls",
			-- "stylua",
		}

		local opt = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		}
		require("lspconfig")[server].setup(opt)
	end,
})
