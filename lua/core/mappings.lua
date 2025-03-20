local utils = require("core.utils")
local map = vim.keymap.set

local function cmap(_, cmd, keys, _)
	map(keys[1], keys[2], cmd)
end

vim.g.mapleader = " "

-----------------------
-- default
-----------------------
-- cmap(nil, function()
-- 	local register = vim.fn.getreg('"')
-- 	register = string.gsub(register, "\n", "")
-- 	vim.api.nvim_feedkeys(register, "i", true)
-- end, { "c", "<C-V>" }, true)
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
---Lazy
cmap(nil, "<cmd>Lazy sync<CR>", { "n", "<leader>ls" }, true)

-- AerialToggle
cmap(nil, "<cmd>AerialToggle!<CR>", { "n", "<leader>t" }, true)

-- nvim-tree
cmap(nil, "<cmd>NvimTreeFindFile<CR>", { "n", "<leader>e" }, true)

-- sidebar
cmap(nil, "<cmd>SidebarNvimFocus<CR>", { "n", "<leader>s" }, true)

-- sidebar
cmap(nil, "<cmd>UndotreeFocus<CR>", { "n", "<leader>u" }, true)

-- clipboard-image
cmap(nil, "<cmd>PasteImgSmarter<CR>", { "n", "<C-v>" }, true)
cmap(nil, "<cmd>PasteImgSmarter<CR>", { "i", "<C-v>" }, true)

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

----------------------------
-- dial
----------------------------
cmap(nil, function()
	require("dial.map").manipulate("increment", "normal")
end, { "n", "<C-a>" }, true)
cmap(nil, function()
	require("dial.map").manipulate("decrement", "normal")
end, { "n", "<C-x>" }, true)
cmap(nil, function()
	require("dial.map").manipulate("increment", "gnormal")
end, { "n", "g<C-a>" }, true)
cmap(nil, function()
	require("dial.map").manipulate("decrement", "gnormal")
end, { "n", "g<C-x>" }, true)

----------------------------
-- substitute.nvim
----------------------------
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
wk.add({
	{ "<leader>g", group = "+Lspsaga+Gitmessenger" },
	{ "<leader>gr", "<cmd>Lspsaga lsp_finder<CR>", desc = "Lspsaga Ref" },
	{ "<leader>gf", "<cmd>Lspsaga finder def+ref<CR>", desc = "Lspsaga Finder" },
	{ "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", desc = "Lspsaga Peek Definition" },
	{ "<leader>ga", "<cmd>Lspsaga code_action<CR>", desc = "Lspsaga Code Action" },
	{ "<leader>gp", "<cmd>Lspsaga rename<CR>", desc = "Lspsaga Preview" },
	{ "<leader>ge", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Lspsaga Diagnostics" },
	{ "<leader>gk", "<cmd>Lspsaga hover_doc<CR>", desc = "Lspsaga Hover Doc" },
	{ "<leader>gm", "<cmd>GitMessenger<CR>", desc = "GitMessenger" },
}, { prefix = "g" })
----------------------------
-- Markdown
----------------------------
wk.add({
	{ "<leader>m", group = "+Markdown" },
	{
		"<leader>mf",
		function()
			utils.openFloatingWindow(vim.g.note_path .. "README.md")
		end,
		desc = "Note",
	},
	{ "<leader>mn", "<cmd>MemoNew<cr>", desc = "Memo New" },
	{ "<leader>ml", "<cmd>Telescope memolist list<cr>", desc = "Memo list" },
	{ "<leader>mg", "<cmd>Telescope memolist live_grep<cr>", desc = "Memo live_grep" },
	{ "<leader>mp", ":MarkdownPreviewToggle<cr>", desc = "Preview" },
	{ "<leader>me", ":MdEval<cr>", desc = "Eval Code Block" },
	{ "<leader>mt", ":MkdnTableFormat<cr>", desc = "Eval Code Block" },
}, { mode = "n" })
----------------------------
-- Telescope
----------------------------
cmap(nil, "<cmd>Telescope  sonictemplate templates<cr>", { "n", "<C-t>" }, true)
cmap({ desc = "Buffers" }, function()
	require("telescope.builtin").buffers()
end, { "n", "<c-b>" }, true)
wk.add({
	{ "<leader>f", group = "+Telescope" },
	{
		"<leader>fg",
		function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end,
		desc = "Live Grep",
	},
	{
		"<leader>fh",
		function()
			require("telescope.builtin").help_tags()
		end,
		desc = "Help Tags",
	},
	{
		"<leader>ff",
		function()
			require("telescope.builtin").find_files({})
		end,
		desc = "Find File",
	},
	{
		"<leader>fo",
		function()
			require("telescope.builtin").oldfiles({ only_cwd = true })
		end,
		desc = "Old Files",
	},
	{ "<leader>ft", "<cmd>Telescope  sonictemplate templates<cr>", desc = "Sonictemplate" },
	{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
	{
		"<leader>fs",
		function()
			require("telescope.builtin").resume()
		end,
		desc = "Resume",
	},
	{ "<leader>fa", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME,WARN,NOTE<cr>", desc = "ToDoComments All" },
	{
		"<leader>fj",
		function()
			require("telescope.builtin").jumplist()
		end,
		desc = "Jump List",
	},
	{
		"<leader>fc",
		function()
			require("telescope.builtin").command_history()
		end,
		desc = "Command History",
	},
	{
		"<leader>f:",
		function()
			require("telescope.builtin").commands()
		end,
		desc = "Commands",
	},
}, { mode = "n" })
