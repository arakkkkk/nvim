vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	callback = function()
		vim.cmd([[
		:setl foldmethod=marker
		:setl foldmarker=<details>,</details>
		]])
	end,
})

-- -- vim.api.nvim_create_autocmd("BufLeave", { pattern = "*.md", command = "silent! wall" })

-- vim.cmd([[
-- :setl foldmethod=marker
-- :setl foldmarker=<details>,</details>
-- ]])

-- vim.cmd([[
-- function! MarkdownFolds()
--   let thisline = getline(v:lnum)
--   if match(thisline, '^<details') >= 0
--     return '>1'
--   elseif match(thisline, '^</details>') >= 0
--     return '<1'
--   endif
--   return '='
-- endfunction
--
-- augroup markdown_folding
--   autocmd!
--   autocmd FileType markdown setlocal foldmethod=expr
--   autocmd FileType markdown setlocal foldexpr=MarkdownFolds()
-- augroup END
-- ]])
