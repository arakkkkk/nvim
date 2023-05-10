local M = {}

function M.getWebTitle(url)
	if not url:match("https?://.+") then
		return false
	end
	local curl = require("plenary.curl")

	local request = {
		url = url,
		method = "GET",
	}
	local res = curl.request(request)

	if not (res.status == 200) then
		print(vim.json.encode(request))
		return error("Error occured in get request.\n" .. res.body)
	end

	local html_txt = res.body
	local _, _, html_title = html_txt:find("<title>(..-)</title>")
	html_title = html_title:gsub("&amp;", "-")
	return html_title
end

function M.getUrl(line)
	local web_url = line:match("https?://[%s]+")
	return web_url
end

function M.setWebTitle()
	local line = vim.fn.getline(".")
	local web_url = M.getUrl(line)
	if not web_url then
		return
	end
	local web_title = M.getWebTitle(web_url)
	if web_url == nil then
		return
	end
	if not web_title then
		return
	end

	local rep_line = line:gsub(web_url, "[" .. web_title .. "]" .. "(" .. web_url .. ")")

	local l = vim.fn.line(".")
	vim.fn.setline(l, rep_line)
end

vim.api.nvim_create_user_command("SetUrl", function()
	M.setWebTitle()
end, {})

function M.insertWebUrl()
	local web_url = vim.fn.getreg("*")
	if not web_url:match("https?://.+") then
		return
	end
	local web_title = M.getWebTitle(web_url)
	if not web_title then
		return
	end

	local ins_line = "[" .. web_title .. "]" .. "(" .. web_url .. ")"

	local line = vim.fn.getline(".")
	local col = vim.fn.charcol(".")
	local rep_line = line:sub(1, col) .. ins_line .. line:sub(col+1)

	vim.fn.setline(vim.fn.line("."), rep_line)
end

vim.api.nvim_create_user_command("InsertUrl", function()
	M.insertWebUrl()
end, {})
return M
