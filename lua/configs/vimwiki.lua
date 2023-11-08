vim.g.vimwiki_list = {
	{
		path = vim.g.note_path,
		syntax = "markdown",
		ext = ".md",
	},
}
vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_conceallevel = 2
vim.g.vimwiki_option_diary_frequency = "weekly"
vim.g.vimwiki_filetypes = { "markdown", "pandoc" }
vim.g.vimwiki_folding = ""

local function local_index()
	vim.cmd("VimwikiGenerateLinks ./*.md")
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "index.md",
	callback = function()
		local_index()
		vim.cmd([[write]])
	end,
})
