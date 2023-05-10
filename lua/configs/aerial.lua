require("aerial").setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,

	show_guides = false,

	open_automatic = false,

	filter_kind = {
		["_"] = {
			"Class",
			"Constructor",
			"Enum",
			"Function",
			"Interface",
			"Module",
			"Method",
			"Struct",
		},
		tex = {
			"Class",
			"Constructor",
			"Function",
			"Interface",
			"Module",
			-- "Method",
			-- "Struct",
		},
	},
})
