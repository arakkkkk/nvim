if vim.fn.getcwd():match("Note$") then
	require("nvim-tree").setup({
		sort_by = "modification_time",
		view = {
			width = 30,
			adaptive_size = false,
		},
		renderer = {
			group_empty = true,
			highlight_opened_files = "none",
			highlight_modified = "none",
		},
		filters = {
			dotfiles = true,
		},
	})
else
	require("nvim-tree").setup({
		sort_by = "case_sensitive",
		view = {
			width = 30,
			adaptive_size = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")
			api.config.mappings.default_on_attach(bufnr)
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "<leader>", function()
					vim.cmd[[SidebarNvimFocus]]
					vim.cmd[[NvimTreeClose]]
			end, opts("Help"))
		end,
	})
end
