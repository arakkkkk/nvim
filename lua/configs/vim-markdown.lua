vim.cmd([[
set conceallevel=2
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0

]])

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	callback = function()
	end,
})
