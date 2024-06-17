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
	autojump = true,

	-- Disable aerial on files with this many lines
	disable_max_lines = 100000,
	-- Disable aerial on files this size or larger (in bytes)
	disable_max_size = 2000000, -- Default 2MB

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
			"String",
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

	keymaps = {
		["?"] = "actions.show_help",
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.jump",
		["<2-LeftMouse>"] = "actions.jump",
		["<C-v>"] = "actions.jump_vsplit",
		["<C-s>"] = "actions.jump_split",
		["p"] = "actions.scroll",
		["<C-j>"] = "actions.down_and_scroll",
		["<C-k>"] = "actions.up_and_scroll",
		["{"] = "actions.prev",
		["}"] = "actions.next",
		["[["] = "actions.prev_up",
		["]]"] = "actions.next_up",
		["q"] = "actions.close",
		["o"] = "actions.tree_toggle",
		["za"] = "actions.tree_toggle",
		["O"] = "actions.tree_toggle_recursive",
		["zA"] = "actions.tree_toggle_recursive",
		["l"] = "actions.tree_open",
		["zo"] = "actions.tree_open",
		["L"] = "actions.tree_open_recursive",
		["zO"] = "actions.tree_open_recursive",
		["h"] = "actions.tree_close",
		["zc"] = "actions.tree_close",
		["H"] = "actions.tree_close_recursive",
		["zC"] = "actions.tree_close_recursive",
		["zr"] = "actions.tree_increase_fold_level",
		["zR"] = "actions.tree_open_all",
		["zm"] = "actions.tree_decrease_fold_level",
		["zM"] = "actions.tree_close_all",
		["zx"] = "actions.tree_sync_folds",
		["zX"] = "actions.tree_sync_folds",
	},
})
