require("cinnamon").setup({
	-- KEYMAPS:
	keymaps = {
		basic = true,
		extra = false,
	},
	options = {
		line = 100,
		time = 1000,
		step_size = {
			-- Number of cursor/window lines moved per step
			vertical = 3,
			-- Number of cursor/window columns moved per step
			horizontal = 3,
		},
	},
})
