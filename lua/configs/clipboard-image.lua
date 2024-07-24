require("clipboard-image").setup({
	default = {
		img_dir = function()
			-- save on buffer's directory
			local abs_path = vim.fn.expand("%:h")
			return abs_path .. "/uploads"
		end,
		img_dir_txt = "./uploads",
		img_name = function()
			return vim.fn.inputdialog("File name -> ")
			-- return os.date("%Y-%m-%d-%H-%M-%S")
		end,
		affix = "![img](%s)",
	},
})
