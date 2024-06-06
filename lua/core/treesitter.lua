vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.tt",
	callback = function()
		vim.bo.filetype = "textile"
	end,
})

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

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.textile = {
	install_info = {
		url = "https://github.com/arakkkkk/tree-sitter-textile", -- local path or git repo
		files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
		-- optional entries:
		branch = "main", -- default branch in case of git repo if different from master
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
	-- filetype = "tt", -- if filetype does not match the parser name
}
