vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	callback = function()
		vim.cmd("syntax match markdownTag '#[a-zA-Z0-9_-]\\+'")
		vim.cmd("syntax match markdownProjects '+[a-zA-Z0-9_-]\\+'")
		vim.cmd("syntax match markdownContextx '@[a-zA-Z0-9_-]\\+'")

		local pat_col = "\\([a-z_-]\\+:.*$\\n\\)"
		local pat_pyphen = "\\(\\t*- .*$\\n\\)"
		vim.cmd("syntax match markdownFrontMatter '^---\\n^\\(\\t*" .. pat_col .. "\\|" .. pat_pyphen .. "\\)*---'")
	end,
})
