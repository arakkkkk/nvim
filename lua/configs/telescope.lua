local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local extensions = require("telescope").extensions
local lga_actions = require("telescope-live-grep-args.actions")
vim.g.telescope_cwd = vim.fn.getcwd()

local swicher = {
	live_grep = function(picker)
		actions.close(picker)
		require("telescope").extensions.live_grep_args.live_grep_args({
			cwd = vim.g.telescope_cwd,
			search_dirs = { vim.g.telescope_cwd },
		})
	end,
	file_browser = function(picker)
		actions.close(picker)
		require("telescope").extensions.file_browser.file_browser({
			path = vim.g.telescope_cwd,
			cwd = vim.g.telescope_cwd,
		})
	end,
	find_files = function(picker)
		actions.close(picker)
		require("telescope").extensions.frecency.frecency({ workspace = vim.g.telescope_cwd})
	end,
}

require("telescope").setup({
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "❯ ",
		path_display = { "truncate" },
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		cache_picker = { num_pickers = 20, limit_entries = 10 },
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		mappings = {
			n = {
				["q"] = actions.close,
				[":q<CR>"] = actions.close,
				["d"] = actions.delete_buffer,
				["<leader>j"] = { "j", type = "command" },
				["<leader>k"] = { "k", type = "command" },
				["<C-t>"] = actions.file_tab,
				["<C-s>"] = actions.file_split,
				["<C-v>"] = actions.file_vsplit,
				["<C-c>"] = actions.close,
				["<C-y>"] = function()
					local buf_select = action_state.get_selected_entry()
					vim.fn.setreg("+", buf_select[1])
				end,
				["<C-^>"] = swicher.file_browser,
			},
			i = {
				["jj"] = { "<Esc>", type = "command" },
				["kk"] = { "<Esc>", type = "command" },
				["<C-t>"] = actions.file_tab,
				["<C-s>"] = actions.file_split,
				["<C-v>"] = actions.file_vsplit,
				["yy"] = function()
					local buf_select = action_state.get_selected_entry()
					vim.fn.setreg("+", buf_select[1])
				end,
				-- ["<CR>"] = function(picker)
				-- 	actions.select_default(picker)
				-- end,
				["<C-^>"] = swicher.file_browser,
			},
		},
	},

	pickers = {
		builtin = { include_extensions = true },
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
			mappings = {
				i = {
					["<C-^>"] = swicher.live_grep,
					["<C-k>"] = swicher.file_browser,
					["<C-j>"] = swicher.live_grep,
				},
			},
		},
		buffers = {
			initial_mode = "normal",
			sort_lastused = true,
			sort_mru = false,
			bunr_width = "dynamic",
			entry_display = {
				create = function(a)
					print(a)
				end,
			},
			path_display = function(opts, path)
				local tail = require("telescope.utils").path_tail(path)
				return string.format("%s                  [ %s ]", tail, path)
			end,
		},
		jumplist = {
			show_line = false,
		},
	},

	extensions = {
		command_center = {
			separator = "         ",
		},
		file_browser = {
			hide_parent_dir = true,
			dir_icon_hl = "DevIconLua",
			path = vim.g.telescope_cwd,
			cwd = vim.g.telescope_cwd,
			mappings = {
				["i"] = {
					["<C-s>"] = extensions.file_browser.actions.sort_by_date,
					["<C-^>"] = swicher.live_grep,
				},
				["n"] = {
					["h"] = extensions.file_browser.actions.goto_parent_dir,
					["H"] = extensions.file_browser.actions.toggle_hidden,
					["^"] = extensions.file_browser.actions.goto_cwd,
					["W"] = extensions.file_browser.actions.toggle_all,
					["<C-s>"] = extensions.file_browser.actions.sort_by_date,
					["<C-^>"] = swicher.live_grep,
				},
			},
		},
		frecency = {
			-- db_root = vim.g.nvim_path .. "src",
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
			disable_devicons = false,
			workspaces = {
				["note"] = vim.g.note_path,
				["nvimplug"] = string.gsub("~/localfile/plug-nvim/", "^~", tostring(os.getenv("HOME"))),
			},
			default_workspace = "CWD",
			-- show_filter_column = { "CWD" },
		},
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			mappings = { -- extend mappings
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
					["<C-^>"] = swicher.find_files,
					["<C-y>"] = function()
						local buf_select = action_state.get_selected_entry()
						vim.fn.setreg("+", buf_select[1]:match("([^:]+):"))
					end,
				},
				n = {
					["yy"] = function()
						local buf_select = action_state.get_selected_entry()
						vim.fn.setreg("+", buf_select[1]:match("([^:]+):"))
					end,
				}
			},
		},
	},
})
require("telescope").load_extension("neoclip")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("command_center")
-- require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")
require("telescope").load_extension("live_grep_args")
