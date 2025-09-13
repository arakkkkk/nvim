-- Auto-reload Neovim config on save
local function reload_all()
	for name, _ in pairs(package.loaded) do
		if name:match("^core") or name:match("^configs") or name:match("^mymods") or name:match("^theme") then
			package.loaded[name] = nil
		end
	end
	dofile(vim.fn.stdpath("config") .. "/init.lua")
	vim.notify("Config reloaded", vim.log.levels.INFO)
end

local function reload_by_path(filepath)
	local cfg = vim.fn.stdpath("config")
	local abs = vim.fn.fnamemodify(filepath, ":p")
	if not (abs:sub(1, #cfg) == cfg) then
		return
	end

	local rel = abs:gsub(vim.pesc(cfg) .. "/", "")
	if rel == "init.lua" then
		reload_all()
		return
	end

	if not rel:match("^lua/.+%.lua$") then
		return
	end

	local mod = rel:gsub("^lua/", ""):gsub("%.lua$", ""):gsub("/", ".")
	package.loaded[mod] = nil
	local ok, err = pcall(require, mod)
	if ok then
		vim.notify("Reloaded " .. mod, vim.log.levels.INFO)
	else
		vim.notify("Reload failed for " .. mod .. ": " .. tostring(err), vim.log.levels.ERROR)
	end
end

local group = vim.api.nvim_create_augroup("ConfigAutoReload", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = group,
	pattern = { "init.lua", "lua/**/*.lua" },
	callback = function(args)
		reload_by_path(args.file)
	end,
})

pcall(vim.api.nvim_del_user_command, "ReloadConfig")
vim.api.nvim_create_user_command("ReloadConfig", function()
	reload_all()
end, { desc = "Reload entire Neovim config" })

-- Session: exclude specific filetypes from being recorded
local session_ignore = vim.api.nvim_create_augroup("SessionIgnoreFiletypes", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = session_ignore,
	-- ここに session 保存から除外したい filetype を追加
	pattern = {
		"help",
		"qf",
		"gitcommit",
		"gitrebase",
		"TelescopePrompt",
		"TelescopeResults",
		"NvimTree",
		"neo-tree",
		"alpha",
		"starter",
		"toggleterm",
		"terminal",
		"dapui_*",
	},
	callback = function()
		-- バッファ一覧に載せず、非表示時は破棄（セッションに残りにくくする）
		vim.opt_local.buflisted = false
		vim.opt_local.bufhidden = "wipe"
	end,
})
