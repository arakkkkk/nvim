require("mason-lspconfig").setup({
	ensure_installed = {
		-- "ruff_lsp",
		-- "pyrigt",
		-- "dockerls",
		-- "docker_compose_language_service",
		-- "sqlls",
		-- "html",
		-- "tsserver",
		-- "lua_ls"
	},
})
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers

require("mason-lspconfig").setup_handlers({
	function(server)
		local opt = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		}
		require("lspconfig")[server].setup(opt)
	end,
})

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}
