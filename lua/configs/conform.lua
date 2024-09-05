require("conform").setup({
	formatters_by_ft = {
		-- markdown = { "markdown-toc" },
		json = { "prettier" },
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		go = { "goimports", "gofmt" },
		python = { "isort", "black" },
		html = { "prettier" },
		css = { "prettier" },
		javascriptreact = { "prettier" },
		javascript = { "prettier" },
		yaml = { "yamlfmt" }
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
