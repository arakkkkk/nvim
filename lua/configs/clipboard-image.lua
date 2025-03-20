require("clipboard-image").setup({
	default = {
		img_dir = function()
			-- save on buffer's directory
			local abs_path = vim.fn.expand("%:h")
			return string.gsub(abs_path, "\\", "/") .. "/uploads"
		end,
		img_dir_txt = "./uploads",
		img_name = function()
			local fn = vim.fn.inputdialog("File name -> ")
			if fn == "" then
				fn = vim.fn.expand("%:t:r") .. "-" .. os.date("%Y%m%d%H%M%S")
			end
			return fn
			-- return os.date("%Y-%m-%d-%H-%M-%S")
		end,
		insert_txt = "![$IMG_NAME]($IMG_PATH)",
		use_forward_slash = "true",
	},
})
