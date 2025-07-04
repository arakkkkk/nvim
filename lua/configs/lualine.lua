local lsp_clients = function()
	local clients = {}
	for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
		table.insert(clients, client.name)
	end
	return " " .. table.concat(clients, ", ")
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = { "NvimTree", "Avante", "AvanteSelectedFiles", "AvanteTodos", "AvanteInput" },
			winbar = { "NvimTree", "Outline" },
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filename",
				path = 1,
				symbols = {
					modified = "  ",
					readonly = " 柳",
					unnamed = "  ",
				},
			},
		},
		lualine_x = { { lsp_clients }, "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filename",
				path = 1,
				symbols = {
					modified = "  ",
					readonly = " 柳",
					unnamed = "  ",
				},
			},
		},
		lualine_x = { "lsp_clients", "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	-- winbar = {
	--   lualine_a = {},
	--   lualine_b = {},
	--   lualine_c = {'filename'},
	--   lualine_x = {},
	--   lualine_y = {},
	--   lualine_z = {}
	-- },
	-- inactive_winbar = {
	--   lualine_a = {},
	--   lualine_b = {},
	--   lualine_c = {'filename'},
	--   lualine_x = {},
	--   lualine_y = {},
	--   lualine_z = {}
	-- },
	tabline = {},
	extensions = {},
})
