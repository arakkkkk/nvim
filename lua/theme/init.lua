C = require("theme.colors")
vim.cmd([[colorscheme nord]])
-- vim.cmd([[colorscheme github_*]])

-- vim.cmd "highlight clear"
-- if vim.fn.exists "syntax_on" then
--   vim.cmd "syntax reset"
-- end
--
-- vim.o.background = "dark"
-- vim.o.termguicolors = true
--
local highlights = {}
--
-- for _, module in ipairs { "base", "treesitter", "lsp" } do
--   highlights = vim.tbl_deep_extend("force", highlights, require("theme." .. module))
-- end
--
for _, plugin in ipairs({
	-- "bufferline",
	"gitsigns",
	-- "hop",
	-- "rainbow",
	-- "indent_blankline",
	-- "nvim-tree",
	-- "nvim-web-devicons",
	"telescope",
	"nvim-cmp",
	"mkdnflow",
	"vimtex",
	"scrollbar",
}) do
	highlights = vim.tbl_deep_extend("force", highlights, require("theme.plugins." .. plugin))
end
--
local utils = require("theme.utils")
for group, spec in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, utils.parse_style(spec))
end
