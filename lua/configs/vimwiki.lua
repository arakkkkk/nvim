vim.g.vimwiki_list = {
	{
		path = "/home/arakkk/Note/",
		syntax = "markdown",
		ext = ".md",
	},
}
vim.g.vimwiki_markdown_link_ext = 1

-- local function local_index()
-- 	local f = vim.fn.expand("%:h")
-- 	f = string.gsub(f, "^.+/Note/", "")
-- 	vim.cmd("VimwikiGenerateLinks " .. f .. "/*.md")
-- end
--
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "index.md",
-- 	callback = function()
-- 		local_index()
-- 		vim.cmd([[write]])
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	pattern = "diary.md",
-- 	callback = function()
-- 		vim.cmd([[VimwikiDiaryGenerateLinks]])
-- 		vim.cmd([[write]])
-- 	end,
-- })
