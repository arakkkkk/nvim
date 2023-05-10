require('indent-o-matic').setup {
	-- Global settings (optional, used as fallback)
	max_lines = 2048,
	standard_widths = { 2, 4, 8 },

	-- Disable indent-o-matic for LISP files
	filetype_lisp = {
		max_lines = 0,
	},


	filetype_lua = {
		standard_widths = { 2 },
	},
	filetype_js = {
		standard_widths = { 2 },
	},


	filetype_pythoh = {
		standard_widths = { 4 },
	},
	filetype_rust = {
		standard_widths = { 4 },
	},
}

