require("aerial").setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,

	show_guides = true,

	open_automatic = false,
	attach_mode = "window",
	highlight_on_hover = true,
	update_events = "TextChanged,InsertLeave",


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
