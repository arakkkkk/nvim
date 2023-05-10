require("bufferline").setup({
	options = {
		offsets = {
			{ filetype = "NvimTree", text = "", padding = 1 },
			{ filetype = "Outline", text = "", padding = 1 },
			{ filetype = "drex", text = "", padding = 1 },
			{ filetype = "SidebarNvim", text = "", padding = 1 },
			{ filetype = "SwitchPanelList", text = "", padding = 1 },
			{ filetype = "undotree", text = "", padding = 1 },
		},
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		separator_style = "thin",
	},
})
