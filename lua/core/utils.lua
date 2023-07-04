_G.utils = {}

function utils.reload_app()
	local current_file = vim.fn.bufname(vim.fn.bufnr())
	print(current_file)
	-- vim.cmd "term"
	if current_file:match(".+%.js$") or current_file:match(".+%.html$") or current_file:match(".+%.py$") then
		io.open('osascript -e \'tell application "firefox" to reload active tab of window 1')
	elseif current_file:match(".+%.tex$") then
		io.open("ptex2pdf -l " .. current_file)
		print("pdf created")
	else
		print("not support format" .. current_file)
	end
end

function utils.run_in_term()
	local file_ext = vim.fn.expand("%:e")
	local file_name = vim.fn.expand("%:p")
	local regist_r = vim.fn.getreg("R")

	if regist_r ~= "" then
		vim.cmd("split")
		vim.cmd("term " .. regist_r)
	elseif file_ext == "hs" then
		vim.cmd("!stack run")
	elseif file_ext == "py" then
		vim.cmd("split")
		vim.cmd("term python " .. file_name)
	elseif file_ext == "lua" then
		vim.cmd("split")
		vim.cmd("term lua " .. file_name)
	end
end

function utils.input(input_text, default)
	input_text = input_text or ""
	default = default or ""
	local ok, input = pcall(vim.fn.inputdialog, input_text, default)
	if ok == nil then
		return false
	end
	if input == "Keyboard interrupt" then
		return false
	end
	return input
end

function utils.getOS()
	-- ask LuaJIT first
	if jit then
		return jit.os
	end

	-- Unix, Linux variants
	local fh,err = assert(io.popen("uname -o 2>/dev/null","r"))
	if fh then
		osname = fh:read()
	end

	return osname or "Windows"
end

return utils
