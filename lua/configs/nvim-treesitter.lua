require("nvim-treesitter").setup({
	ensure_installed = { "lua", "regex", "bash", "markdown", "markdown_inline", "turtle" },
	sync_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autopairs = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
	indent = {
		enable = false,
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = nil,
	},
	autotag = {
		enable = true,
	},
})
