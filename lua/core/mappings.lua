local utils = require("core.utils")
local map = vim.keymap.set
local noremap = { noremap = true }
local cc_loaded, cc = pcall(require, "command_center")
local ADD = cc_loaded and cc.mode.ADD or nil
local SET = cc_loaded and cc.mode.SET or nil
local ADD_SET = cc_loaded and cc.mode.ADD_SET or nil

local function cmap(ops, cmd, keys, mode)
	ops = ops or { desc = keys[2], cat = "default" }
	ops.cat = ops.cat or "default"
	keys[3] = keys[3] or noremap
	if cc_loaded then
		cc.add({
			{
				desc = ops.desc,
				cmd = cmd,
				keybindings = keys,
				category = ops.cat,
			},
		}, {
			mode = mode,
		})
	else
		map(keys[1], keys[2], cmd)
	end
end

vim.g.mapleader = " "

-----------------------
-- default
-----------------------
cmap(nil, "<cmd>w<cr>", { "n", ":w<cr>" }, SET)
cmap(nil, "<cmd>q<cr>", { "n", ":q<cr>" }, SET)
cmap(nil, "<cmd>e<cr>", { "n", ":e<cr>" }, SET)
cmap(nil, function()
	vim.cmd("wa")
	vim.cmd("qa")
end, { "n", "<leader>q" }, SET)
cmap(nil, function()
	vim.cmd("wa")
end, { "n", "<leader>w" }, SET)
cmap(nil, ":split<cr>", { "n", "<leader>ss" }, SET)
cmap(nil, ":vsplit<cr>", { "n", "<leader>sv" }, SET)
cmap(nil, function()
	print("Path yanked >>", vim.fn.expand("%:.:p"))
	vim.cmd("let @* = expand('%:.:p')")
end, { "n", "yp" }, SET)
cmap(nil, function()
	print("Path yanked >>", vim.fn.expand("%:p"))
	vim.cmd("let @* = expand('%:p')")
end, { "n", "yP" }, SET)
cmap({ desc = "Clean buffers" }, function()
	vim.cmd("BDelete other")
end, { "n", ":cl" }, ADD_SET)

-----------------------
-- option
-----------------------
cmap(nil, ":<Up><cr>", { "n", ":<cr>" }, SET)
cmap(nil, ":open<cr>", { "n", ":!open<cr>" }, SET)
cmap(nil, function()
	utils.run_in_term()
end, {
	"n",
	":r<CR>",
}, SET)
cmap(nil, function()
	vim.cmd.write()
	utils.run_in_term()
end, {
	"n",
	":wr<CR>",
}, SET)
cmap(nil, function()
	local text = utils.input("Quic run shell command: ", vim.fn.getreg("R"))
	if text then
		vim.cmd("call setreg('r', '" .. text .. "')")
	end
end, {
	"n",
	":rr<CR>",
}, SET)
cmap(nil, function()
	vim.cmd(vim.fn.getreg("C"))
end, {
	"n",
	":c<CR>",
}, SET)
cmap(nil, function()
	local text = utils.input("Quic run vim command: ", vim.fn.getreg("C"))
	if text then
		vim.cmd("call setreg('c', '" .. text .. "')")
	end
end, {
	"n",
	":cc<CR>",
}, SET)
-- xdotool search --onlyvisible --class Firefox key ctrl+r

-----------------------
-- plugins
-----------------------
-- packer
cmap(nil, "<cmd>PackerSync<CR>", { "n", "<leader>ps" }, SET)

-- AerialToggle
cmap(nil, "<cmd>AerialToggle!<CR>", { "n", "<leader>t" }, SET)
cmap(nil, "<cmd>AerialToggle!<CR>", { "n", "<C-0>" }, SET)

-- nvim-tree
cmap(nil, "<cmd>NvimTreeFindFile<CR>", { "n", "<leader>e" }, SET)
cmap(nil, "<cmd>NvimTreeToggle<CR>", { "n", "<C-1>" }, SET)
cmap(nil, require("nvim-tree.api").marks.navigate.next, { "n", "<leader>mn" }, SET)
cmap(nil, require("nvim-tree.api").marks.navigate.prev, { "n", "<leader>mp" }, SET)
cmap(nil, require("nvim-tree.api").marks.navigate.select, { "n", "<leader>ms" }, SET)

-- sidebar
cmap(nil, "<cmd>SidebarNvimToggle<CR>", { "n", "<C-2>" }, SET)

-- sidebar
cmap(nil, "<cmd>UndotreeToggle<CR>", { "n", "<C-3>" }, SET)

-- null-ls
cmap(nil, function()
	vim.lsp.buf.format()
end, { "n", "<leader>fm" }, SET)

-- telescope
cmap(nil, ":Telescope command_center<cr>", { "n", "<leader>k" }, SET)
--------------------
-- Default categories
--------------------
cmap(nil, ":Telescope command_center category=default<cr>", { "n", "<leader>f" }, SET)
cmap({ desc = "Live grep" }, function()
	require("telescope").extensions.live_grep_args.live_grep_args({})
end, { "n", "<leader>fg" }, ADD_SET)
cmap({ desc = "Help tags" }, function()
	require("telescope.builtin").help_tags()
end, { "n", "<leader>fh" }, ADD_SET)
cmap({ desc = "Neoclip" }, ":Telescope neoclip<cr>", { "n", "<leader>fr" }, ADD_SET)
cmap({ desc = "Find files" }, function()
	require("telescope.builtin").find_files({})
end, { "n", "<leader>ff" }, ADD_SET)
cmap({ desc = "Old files" }, function()
	require("telescope.builtin").oldfiles({ only_cwd = true })
end, { "n", "<leader>fo" }, ADD_SET)
cmap({ desc = "Ctags outline" }, function()
	vim.cmd("Telescope ctags_outline outline")
end, { "n", "<leader>ft" }, ADD_SET)
cmap({ desc = "Diagnostics" }, function()
	vim.cmd("Telescope diagnostics")
end, { "n", "<leader>fd" }, ADD_SET)
cmap({ desc = "Resume" }, function()
	vim.cmd("Telescope resume")
end, { "n", "<leader>fs" }, ADD_SET)
cmap({ desc = "ToDoComments all" }, function()
	vim.cmd("TodoTelescope keywords=TODO,FIX,FIXME,WARN,NOTE")
end, { "n", "<leader>fa" }, ADD_SET)
cmap({ desc = "Jump list" }, function()
	require("telescope.builtin").jumplist()
end, { "n", "<leader>fj" }, ADD_SET)
cmap({ desc = "Grep cheat_sheets", cat = "default" }, function()
	vim.g.telescope_cwd = vim.g.note_path
	require("telescope").extensions.live_grep_args.live_grep_args({
		prompt_title = "Cheat sheets",
		cwd = "~/localfile/",
		search_dirs = { "~/localfile/" },
	})
end, { "n", "<leder>f^", cat = "default" }, ADD_SET)
cmap({ desc = "Buffers" }, function()
	require("telescope.builtin").buffers()
end, { "n", "<c-b>" }, ADD_SET)
cmap({ desc = "Command history" }, function()
	require("telescope.builtin").command_history()
end, { "n", "q:" }, ADD_SET)
cmap({ desc = "Commands" }, function()
	require("telescope.builtin").commands()
end, { "n", "::" }, ADD_SET)

--------------------
-- App categories
--------------------
cmap(nil, ":Telescope command_center category=app<cr>", { "n", "<leader>a" }, SET)
cmap(
	{ desc = "KanbanOpen", cat = "app" },
	":KanbanOpen ~/MyDrive/Applycations/Note/TODO/PersonalKanban.md<cr>",
	{ "n", "<leader>ak" },
	ADD_SET
)
cmap({ desc = "Note", cat = "app" }, function()
	vim.cmd(":e " .. vim.g.note_path .. "index.md")
end, { "n", "mm" }, ADD_SET)
cmap({ desc = "Find note status open", cat = "app" }, function()
	require("telescope").extensions.live_grep_args.live_grep_args({ default_text = '"status: open"' })
end, { "n", "mo" }, ADD_SET)
cmap({ desc = "Find tag root", cat = "app" }, function()
	require("telescope").extensions.live_grep_args.live_grep_args({ default_text = '"tag: \\[.*\\broot\\b.*\\]"' })
end, { "n", "mr" }, ADD_SET)
cmap({ desc = "Daily note", cat = "app" }, function()
	vim.cmd(":e " .. vim.g.note_path .. "diary/" .. os.date("%Y-%m-%d") .. ".md")
end, { "n", "md" }, ADD_SET)
cmap({ desc = "Weekly note", cat = "markdown" }, function()
	vim.cmd(":e " .. vim.g.note_path .. "diary/week-" .. os.date("%Y-%m-") .. os.date("%d") - os.date("%w") .. ".md")
	vim.cmd(":$")
end, { "n", "mw" }, ADD_SET)
cmap({ desc = "Find note", cat = "app" }, function()
	require("telescope.builtin").find_files({
		cwd = vim.g.note_path,
	})
end, { "n", "mf" }, ADD_SET)
cmap({ desc = "Weekly note", cat = "markdown" }, function()
	if vim.bo[vim.api.nvim_get_current_buf()].filetype ~= "markdown" then
		return
	end
	local peek = require("peek")
	if not peek.is_open() then
		-- vim.fn.system("i3-msg split horizontal")
		peek.open()
	elseif peek.is_open() then
		peek.close()
		-- vim.fn.system('i3-msg move left')
	end
end, { "n", "mp" }, ADD_SET)

--------------------
-- Markdown categories
--------------------
cmap(nil, ":Telescope command_center category=markdown<cr>", { "n", "<leader>m" }, SET)
cmap({ desc = "Markdown TODO", cat = "markdown" }, ":Marktodo float<cr>", { "n", "mt" }, ADD_SET)
cmap({ desc = "Csv to table", cat = "markdown" }, ":MakeTable<cr>", { "n", "F1" }, ADD)
cmap({ desc = "Tsv to table", cat = "markdown" }, ":MakeTable! \t<cr>", { "n", "F1" }, ADD)
cmap({ desc = "Insert web link", cat = "markdown" }, ":MdUrlInsert<cr>", { "n", "F1" }, ADD)
cmap({ desc = "Set web link title", cat = "markdown" }, ":MdUrlSet<cr>", { "n", "F1" }, ADD)
cmap({ desc = "Paste image", cat = "markdown" }, ":PasteImg<cr>", { "n", "F1" }, ADD)

-- smart-splits
local smart_splits = require("smart-splits")
cmap(nil, function()
	smart_splits.move_cursor_left()
end, { "n", "<C-h>" }, SET)
cmap(nil, function()
	smart_splits.move_cursor_down()
end, { "n", "<C-j>" }, SET)
cmap(nil, function()
	smart_splits.move_cursor_up()
end, { "n", "<C-k>" }, SET)
cmap(nil, function()
	smart_splits.move_cursor_right()
end, { "n", "<C-l>" }, SET)
cmap(nil, function()
	smart_splits.resize_up()
end, { "n", "<S-Up>" }, SET)
cmap(nil, function()
	smart_splits.resize_down()
end, { "n", "<S-Down>" }, SET)
cmap(nil, function()
	smart_splits.resize_left()
end, { "n", "<S-Left>" }, SET)
cmap(nil, function()
	smart_splits.resize_right()
end, { "n", "<S-Right>" }, SET)

-- bufferline
cmap(nil, "<cmd>BufferLineCycleNext<cr>", { "n", "<S-l>" }, SET)
cmap(nil, "<cmd>BufferLineCyclePrev<cr>", { "n", "<S-h>" }, SET)
cmap(nil, "<cmd>BufferLineMoveNext<cr>", { "n", ">b" }, SET)
cmap(nil, "<cmd>BufferLineMovePrev<cr>", { "n", "<b" }, SET)
cmap(nil, "<cmd>Bdelete<cr>", { "n", "<leader>c" }, SET)

-- hop.vim
cmap(nil, "<cmd>HopWord<CR>", { "n", "<leader>o" }, SET)

-- toggleterm
local Terminal = require("toggleterm.terminal").Terminal
cmap(nil, function()
	Terminal:new({ count = 1 }):toggle()
end, { "n", "<C-\\>" }, SET)
cmap(nil, function()
	Terminal:new({ count = 1 }):toggle()
end, { "n", "<C-¥>" }, SET)
cmap(nil, function()
	Terminal:new({ direction = "vertical", count = 2 }):toggle()
end, { "n", "<leader>tv" }, SET)
cmap(nil, function()
	Terminal:new({ direction = "horizontal", count = 3 }):toggle()
end, { "n", "<leader>th" }, SET)
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
	end, { "n", ":" .. key .. "<cr>" }, SET)
end

-- substitute.nvim
cmap(nil, function()
	require("substitute").operator()
end, { "n", "s" }, SET)
cmap(nil, function()
	require("substitute").line()
end, { "n", "ss" }, SET)
cmap(nil, function()
	require("substitute").eol()
end, { "n", "S" }, SET)
cmap(nil, function()
	require("substitute").visual()
end, { "x", "s" }, SET)

-- Git
cmap({ desc = "Git log", cat = "app" }, function()
	vim.cmd("split")
	vim.cmd("term git log " .. vim.fn.expand("%"))
end, { "n", ":gl<cr>" }, ADD_SET)
cmap({ desc = "Git diff", cat = "app" }, function()
	vim.cmd("split")
	vim.cmd("term git diff " .. vim.fn.expand("%"))
end, { "n", ":gd<cr>" }, ADD_SET)

-- Others
cmap({ desc = "Hi group", cat = "app" }, function()
	vim.cmd("echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')")
end, { "n", ":higroup<cr>" }, ADD_SET)
cmap({ desc = "Hi item", cat = "app" }, function()
	vim.cmd("echo synIDattr(synID(line('.'), col('.'), 1), 'name')")
end, { "n", ":hiitem<cr>" }, ADD_SET)

-- translation
cmap({ desc = "Translator", cat = "app" }, function()
	local text = utils.input("Translator: ")
	if text then
		vim.cmd("split")
		if text:match("[%sa-zA-Z0-9_]+") then
			vim.cmd("term trans {en=ja} " .. text)
		else
			vim.cmd("term trans {ja=en} " .. text)
		end
	end
end, { "n", ":tl<cr>" }, ADD_SET)

-- vim.api.nvim_create_user_command("Replace", function()
-- 	vim.cmd("%s/kdi/km/g")
-- 	vim.cmd("%s/kdk/kmd/g")
-- 	vim.cmd("%s/kdb/kmn/g")
-- end, {})
