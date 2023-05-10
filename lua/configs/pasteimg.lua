M = {}
M.ops = {
	default_path = "uploads/",
	abs_buf = true
}
local function insertText(text)
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. text .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end
function M.pasteimg()
	local oka, path_img = pcall(vim.fn.inputdialog, "File name -> ", M.ops.default_path)
	if oka == nil then
		print("cancel")
		return
	end

	local abs = M.ops.abs_buf and string.gsub(vim.fn.expand("%:h"), vim.fn.getcwd(), "") or "."
	local a, b pcall(os.execute, "pngpaste " .. abs .. "/" .. path_img .. ".png", "r")

	local img_name_label = string.gsub(path_img, "([^/]+)$", "%1")
	local image_link = "![" .. img_name_label .. "](" .. path_img .. ".png)"
	insertText(image_link)
end
return M

-- vim.api.nvim_create_user_command("PasteImage", function()
-- 	require("configs.pasteimg").pasteimg()
-- end, {})
