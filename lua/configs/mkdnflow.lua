-- ** DEFAULT SETTINGS; TO USE THESE, PASS NO ARGUMENTS TO THE SETUP FUNCTION **
require("mkdnflow").setup({
	modules = {
		bib = true,
		buffers = true,
		conceal = true,
		cursor = true,
		folds = true,
		links = true,
		lists = true,
		maps = true,
		paths = true,
		tables = true,
	},
	filetypes = { md = true, rmd = true, markdown = true },
	create_dirs = true,
	perspective = {
		priority = "current",
		fallback = "current",
		root_tell = false,
		nvim_wd_heel = false,
	},
	wrap = false,
	bib = {
		default_path = nil,
		find_in_root = true,
	},
	silent = false,
	links = {
		style = "markdown",
		name_is_source = false,
		conceal = true,
		implicit_extension = nil,
		transform_implicit = false,
		transform_explicit = function(text)
			text = text:gsub(" ", "-")
			text = text:lower()
			text = os.date("%Y-%m-%d_") .. text
			return "subdir/" .. text
		end,
	},
	to_do = {
		symbols = { " ", "-", "x" },
		update_parents = true,
		not_started = " ",
		in_progress = "-",
		complete = "x",
	},
	tables = {
		trim_whitespace = true,
		format_on_move = true,
		auto_extend_rows = false,
		auto_extend_cols = false,
	},
	mappings = {
		MkdnEnter = { { "n", "v", "i" }, "<CR>" },
		MkdnTab = false,
		MkdnSTab = false,
		MkdnNextLink = { "n", "<Tab>" },
		MkdnPrevLink = { "n", "<S-Tab>" },
		MkdnNextHeading = { "n", "]]" },
		MkdnPrevHeading = { "n", "[[" },
		MkdnGoBack = { "n", "<BS>" },
		MkdnGoForward = { "n", "<Del>" },
		MkdnFollowLink = false, -- see MkdnEnter
		MkdnDestroyLink = { "n", "<M-CR>" },
		MkdnTagSpan = { "v", "<M-CR>" },
		MkdnMoveSource = { "n", "<F2>" },
		MkdnYankAnchorLink = { "n", "ya" },
		MkdnYankFileAnchorLink = { "n", "yfa" },
		MkdnIncreaseHeading = { "n", "+" },
		MkdnDecreaseHeading = { "n", "-" },
		MkdnToggleToDo = { { "n", "v" }, "mc" },
		MkdnNewListItem = false,
		MkdnNewListItemBelowInsert = { "n", "o" },
		MkdnNewListItemAboveInsert = { "n", "O" },
		MkdnExtendList = false,
		MkdnUpdateNumbering = { "n", "<leader>nn" },
		MkdnTableNextCell = { "i", "<Tab>" },
		MkdnTablePrevCell = { "i", "<S-Tab>" },
		MkdnTableNextRow = false,
		MkdnTablePrevRow = { "i", "<M-CR>" },
		MkdnTableNewRowBelow = { "n", "<leader>ir" },
		MkdnTableNewRowAbove = { "n", "<leader>iR" },
		MkdnTableNewColAfter = { "n", "<leader>ic" },
		MkdnTableNewColBefore = { "n", "<leader>iC" },
		MkdnFoldSection = false,
		MkdnUnfoldSection = false,
	},
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.md",
	callback = function()
		-- vim.keymap.set("n", "<cr>", function()
		-- 	local line = vim.fn.getline(".")
		-- 	if line:match("^- %[.%]") then
		-- 		vim.cmd("MkdnToggleToDo")
		-- 	else
		-- 		vim.cmd("MkdnEnter")
		-- 	end
		-- 	vim.cmd([[write]])

		-- end, { silent = true, buffer = vim.api.nvim_get_current_buf() })
	local bufline = vim.fn.getline(1, "$")
	if #bufline == 1 and bufline[1] == "" then
			-- vim.cmd("Template note")
	end
	end,
})

vim.api.nvim_create_autocmd("BufLeave", { pattern = "*.md", command = "silent! wall" })
