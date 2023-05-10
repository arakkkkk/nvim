vim.api.nvim_create_autocmd("{{_variable_}}", {
	pattern = "*",
	callback = function()
		{{_cursor_}}
	end,
})
