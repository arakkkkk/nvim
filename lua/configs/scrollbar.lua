require("scrollbar").setup({
	marks = {
		Cursor = {
			text = "•",
			priority = 0,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "Normal",
		},
		Search = {
			text = { "-", "=" },
			priority = 1,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "Search",
		},
		Error = {
			text = { "-", "=" },
			priority = 2,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "DiagnosticVirtualTextError",
		},
		Warn = {
			text = { "-", "=" },
			priority = 3,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "DiagnosticVirtualTextWarn",
		},
		Info = {
			text = { "-", "=" },
			priority = 4,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "DiagnosticVirtualTextInfo",
		},
		Hint = {
			text = { "-", "=" },
			priority = 5,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "DiagnosticVirtualTextHint",
		},
		Misc = {
			text = { "-", "=" },
			priority = 6,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "Normal",
		},
		GitAdd = {
			text = "┆",
			priority = 7,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "GitSignsAdd",
		},
		GitChange = {
			text = "┆",
			priority = 7,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "GitSignsChange",
		},
		GitDelete = {
			text = "-",
			priority = 7,
			gui = nil,
			color = nil,
			cterm = nil,
			color_nr = nil, -- cterm
			highlight = "GitSignsDelete",
		},
	},
	excluded_buftypes = {
		"terminal",
	},
	excluded_filetypes = {
		"cmp_docs",
		"cmp_menu",
		"noice",
		"prompt",
		"TelescopePrompt",
		"NvimTree",
	},
	handlers = {
		cursor = false,
	},
})

local kopts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
