require("clipboard-image").setup({
	default = {
		img_dir = function ()
		  	local abs_path = vim.fn.expand("%:h")
		  	return abs_path .. "/uploads"
		end,
		img_dir_txt = "uploads",
		img_name = function()
			return vim.fn.inputdialog("File name -> ")
		end,
		affix = "![img](%s)",
	},
})
