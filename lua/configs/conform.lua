require("conform").setup({
	formatters_by_ft = {
		-- markdown = { },
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		go = { "goimports", "gofmt" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
