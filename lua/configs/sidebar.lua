require("sidebar-nvim").setup({
	disable_default_keybindings = 0,
	bindings = nil,
	open = false,
	side = "left",
	initial_width = 35,
	hide_statusline = false,
	update_interval = 1000,
	sections = { "buffers", "todos", "diagnostics" },
	section_separator = { "" },
	section_title_separator = {},
	containers = {
		attach_shell = "/bin/sh",
		show_all = true,
		interval = 5000,
	},
	datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },

	todos = {
		icon = "",
		ignored_paths = { "~" }, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
		initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
	},

	buffers = {
		icon = "",
		ignored_buffers = {}, -- ignore buffers by regex
		sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
		show_numbers = false, -- whether to also show the buffer numbers
		ignore_not_loaded = true, -- whether to ignore not loaded buffers
		ignore_terminal = true, -- whether to show terminal buffers in the list
	},
})
