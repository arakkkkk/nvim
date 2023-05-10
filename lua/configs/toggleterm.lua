local M
require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		else
			return 20
		end
	end,
	insert_mappings = true,
	terminal = true,
	start_in_insert = true,
	shell = "fish",
	-- open_mapping = [[<c-\>]],
	shading_factor = 2,
	direction = "float",
	float_opts = {
		border = "curved",
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	on_open = function(term)
		local set = { buffer = term.bufnr }
		vim.keymap.set("t", "<C-¥>", "<cmd>ToggleTermToggleAll<CR>", set)
		vim.keymap.set("t", "<C-\\>", "<cmd>ToggleTermToggleAll<CR>", set)
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", set)
		if term.direction ~= "float" then
			vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-h><cmd>SmartCursorMoveLeft<cr><esc>", set)
			vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-h><cmd>SmartCursorMoveRight<cr><esc>", set)
			vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-h><cmd>SmartCursorMoveUp<cr><esc>", set)
			vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-h><cmd>SmartCursorMoveDown<cr><esc>", set)
		end
		-- for k, v in pairs(term) do
		-- 	print(k, v)
		-- end
	end,
})
