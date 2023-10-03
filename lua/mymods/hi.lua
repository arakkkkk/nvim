vim.api.nvim_create_user_command("Higroup", function()
	vim.cmd("echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')")
end, {})

vim.api.nvim_create_user_command("Hiitem", function()
	vim.cmd("echo synIDattr(synID(line('.'), col('.'), 1), 'name')")
end, {})
