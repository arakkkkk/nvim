require("conform").setup({
	formatters_by_ft = {
		markdown = { "markdown-toc" },
		json = { "prettier" },
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		go = { "goimports", "gofmt" },
		python = { "isort", "black" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
