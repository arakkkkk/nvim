local utils = require("core.utils")
local map = vim.keymap.set

local function cmap(_, cmd, keys, _)
	map(keys[1], keys[2], cmd)
end

vim.g.mapleader = " "

-----------------------
-- default
-----------------------
cmap(nil, function()
	local register = vim.fn.getreg('"')
	register = string.gsub(register, "\n", "")
	vim.api.nvim_feedkeys(register, "i", true)
end, { "c", "<C-V>" }, true)
cmap(nil, "<cmd>Bdelete<cr>", { "n", "<leader>c" }, true)

cmap(nil, function()
	vim.cmd("wa")
	vim.cmd("qa")
end, { "n", "<leader>q" }, true)
cmap(nil, function()
	print("Path yanked >>", vim.fn.expand("%:.:p"))
	vim.cmd("let @* = expand('%:.:p')")
end, { "n", "yp" }, true)
cmap(nil, function()
	print("Path yanked >>", vim.fn.expand("%:p"))
	vim.cmd("let @* = expand('%:p')")
end, { "n", "yP" }, true)
cmap({ desc = "Clean buffers" }, function()
	vim.cmd("BDelete other")
end, { "n", "<leader><BS>" }, true)

-----------------------
-- option
-----------------------
cmap(nil, function()
	utils.run_in_term()
end, {
	"n",
	":r<CR>",
}, true)
cmap(nil, function()
	vim.cmd.write()
	utils.run_in_term()
end, {
	"n",
	":wr<CR>",
}, true)
cmap(nil, function()
	local text = utils.input("Quic run shell command: ", vim.fn.getreg("R"))
	if text then
		vim.cmd("call setreg('r', '" .. text .. "')")
	end
end, {
	"n",
	":rr<CR>",
}, true)
cmap(nil, function()
	vim.cmd(vim.fn.getreg("C"))
end, {
	"n",
	":c<CR>",
}, true)
cmap(nil, function()
	local text = utils.input("Quic run vim command: ", vim.fn.getreg("C"))
	if text then
		vim.cmd("call setreg('c', '" .. text .. "')")
	end
end, {
	"n",
	":cc<CR>",
}, true)

-----------------------
-- plugins
-----------------------
cmap(nil, "<cmd>Lazy sync<CR>", { "n", "<leader>ls" }, true)

-- AerialToggle
cmap(nil, "<cmd>AerialToggle!<CR>", { "n", "<leader>t" }, true)

-- nvim-tree
cmap(nil, "<cmd>NvimTreeFindFile<CR>", { "n", "<leader>e" }, true)

-- sidebar
cmap(nil, "<cmd>SidebarNvimFocus<CR>", { "n", "<leader>s" }, true)

-- sidebar
cmap(nil, "<cmd>UndotreeFocus<CR>", { "n", "<leader>u" }, true)

-- smart-splits
local smart_splits = require("smart-splits")
cmap(nil, function()
	smart_splits.move_cursor_left()
end, { "n", "<C-h>" }, true)
cmap(nil, function()
	smart_splits.move_cursor_left()
end, { "n", "<BS>" }, true)
cmap(nil, function()
	smart_splits.move_cursor_down()
end, { "n", "<C-j>" }, true)
cmap(nil, function()
	smart_splits.move_cursor_up()
end, { "n", "<C-k>" }, true)
cmap(nil, function()
	smart_splits.move_cursor_right()
end, { "n", "<C-l>" }, true)
cmap(nil, function()
	smart_splits.resize_up()
end, { "n", "<S-Up>" }, true)
cmap(nil, function()
	smart_splits.resize_down()
end, { "n", "<S-Down>" }, true)
cmap(nil, function()
	smart_splits.resize_left()
end, { "n", "<S-Left>" }, true)
cmap(nil, function()
	smart_splits.resize_right()
end, { "n", "<S-Right>" }, true)

-- bufferline
cmap(nil, "<cmd>BufferLineCycleNext<cr>", { "n", "<S-l>" }, true)
cmap(nil, "<cmd>BufferLineCyclePrev<cr>", { "n", "<S-h>" }, true)
cmap(nil, "<cmd>BufferLineMoveNext<cr>", { "n", ">b" }, true)
cmap(nil, "<cmd>BufferLineMovePrev<cr>", { "n", "<b" }, true)
cmap(nil, "<cmd>Bdelete<cr>", { "n", "<leader>c" }, true)

-- hop.vim
cmap(nil, "<cmd>HopWord<CR>", { "n", "<leader>j" }, true)

-- toggleterm
local Terminal = require("toggleterm.terminal").Terminal
cmap(nil, function()
	Terminal:new({ count = 1 }):toggle()
end, { "n", "<C-\\>" }, true)
cmap(nil, function()
	Terminal:new({ count = 1 }):toggle()
end, { "n", "<C-¥>" }, true)
cmap(nil, function()
	Terminal:new({ direction = "vertical", count = 2 }):toggle()
end, { "n", "<leader>tv" }, true)
cmap(nil, function()
	Terminal:new({ direction = "horizontal", count = 3 }):toggle()
end, { "n", "<leader>th" }, true)
local cmd_set = {
	ht = "htop",
	py = "python",
	lg = "lazygit",
	ld = "lazydocker",
	gh = "gh dash",
	tt = "taskwarrior-tui",
}
for key, cmd in pairs(cmd_set) do
	cmap(nil, function()
		Terminal:new({
			cmd = cmd,
			hidden = true,
			on_open = function(term)
				print(term)
			end,
		}):toggle()
	end, { "n", ":" .. key .. "<cr>" }, true)
end

-- substitute.nvim
cmap(nil, function()
	require("substitute").operator()
end, { "n", "s" }, true)
cmap(nil, function()
	require("substitute").line()
end, { "n", "ss" }, true)
cmap(nil, function()
	require("substitute").eol()
end, { "n", "S" }, true)
cmap(nil, function()
	require("substitute").visual()
end, { "x", "s" }, true)

local wk = require("which-key")
----------------------------
-- Lspsaga
----------------------------
cmap({ desc = "lspsaga: hover doc", cat = "lsp" }, "<cmd>Lspsaga hover_doc<CR>", { "n", "K" }, true)
cmap(nil, "<cmd>Lspsaga diagnostic_jump_next<CR>", { "n", "]e" }, true)
cmap(nil, "<cmd>Lspsaga diagnostic_jump_prev<CR>", { "n", "[e" }, true)
wk.register({
	name = "+Lspsaga",
	r = { "<cmd>Lspsaga lsp_finder<CR>", "Ref" },
	f = { "<cmd>Lspsaga finder def+ref<CR>", "Finder" },
	d = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
	a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
	p = { "<cmd>Lspsaga rename<CR>", "Preview" },
	e = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Diagnostics" },
}, { prefix = "g" })
----------------------------
-- Markdown
----------------------------
wk.register({
	name = "+Markdown",
	r = {
		function()
			utils.openFloatingWindow(vim.g.note_path .. "README.md")
		end,
		"Note",
	},
	n = { "<cmd>MemoNew<cr>", "Memo New" },
	l = { "<cmd>Telescope memo list<cr>", "Memo list" },
	g = { "<cmd>Telescope memo live_grep<cr>", "Memo live_grep" },
	p = { ":MarkdownPreviewToggle<cr>", "Preview" },
}, { prefix = "m" })
----------------------------
-- Telescope
----------------------------
cmap(nil, "<cmd>Telescope  sonictemplate templates<cr>", { "n", "<C-t>" }, true)
cmap({ desc = "Buffers" }, function()
	require("telescope.builtin").buffers()
end, { "n", "<c-b>" }, true)
wk.register({
	f = {
		name = "+Telescope",
		g = {
			function()
				require("telescope").extensions.live_grep_args.live_grep_args({})
			end,
			"Live Grep",
		},
		h = {
			function()
				require("telescope.builtin").help_tags()
			end,
			"Help Tags",
		},
		f = {
			function()
				require("telescope.builtin").find_files({})
			end,
			"Find File",
		},
		o = {
			function()
				require("telescope.builtin").oldfiles({ only_cwd = true })
			end,
			"Old Files",
		},
		t = { "<cmd>Telescope  sonictemplate templates<cr>", "Sonictemplate" },
		d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		s = {
			function()
				require("telescope.builtin").resume()
			end,
			"Resume",
		},
		a = { "<cmd>TodoTelescope keywords=TODO,FIX,FIXME,WARN,NOTE<cr>", "ToDoComments All" },
		j = {
			function()
				require("telescope.builtin").jumplist()
			end,
			"Jump List",
		},
		c = {
			function()
				require("telescope.builtin").command_history()
			end,
			"Command History",
		},
		[":"] = {
			function()
				require("telescope.builtin").commands()
			end,
			"Commands",
		},
	},
}, { prefix = "<leader>" })
