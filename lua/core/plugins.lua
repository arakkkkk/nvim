-- NOTE: Plugins list is built first so we can post-process specs.
local plugins = {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	{ "nvim-lua/plenary.nvim", lazy = true },

	{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },

	---------------------
	-- AI
	---------------------
	-- { "github/copilot.vim" },
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
				auto_trigger = false,
			})
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({})
		end,
	},

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		build = "make tiktoken", -- Only on MacOS or Linux
		config = function()
			require("configs.copilot-chat")
		end,
	},

	-- {
	-- 	"yetone/avante.nvim",
	-- 	build = function()
	-- 		-- conditionally use the correct build system for the current OS
	-- 		if vim.fn.has("win32") == 1 then
	-- 			return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
	-- 		else
	-- 			return "make"
	-- 		end
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"stevearc/dressing.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("configs.avante")
	-- 	end,
	-- },

	---------------------
	-- File exploler
	---------------------
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("configs.nvim-tree")
		end,
	},
	---------------------
	-- Telescope
	---------------------
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.5",
		cmd = { "Telescope" },
		config = function()
			require("configs.telescope")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", lazy = true },
	{ "nvim-telescope/telescope-file-browser.nvim", lazy = true },
	{ "nvim-telescope/telescope-live-grep-args.nvim", lazy = true },
	{ "arakkkkk/telescope-sonictemplate.nvim", lazy = true },
	{ "arakkkkk/telescope-memolist.nvim", lazy = true },

	---------------------
	-- Theme
	---------------------
	-- theme
	{ "nordtheme/vim" },
	{ "projekt0n/github-nvim-theme" },
	{ "kyazdani42/nvim-web-devicons", lazy = true },

	-- tab
	{ "lukas-reineke/indent-blankline.nvim" },

	{ "famiu/bufdelete.nvim", cmd = { "Bdelete" }, lazy = true },

	{
		"akinsho/bufferline.nvim",
		config = function()
			require("configs.bufferline")
		end,
	},

	{ "arkav/lualine-lsp-progress" },

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("configs.lualine")
		end,
	},

	{
		"declancm/cinnamon.nvim",
		config = function()
			require("configs.cinnamon")
		end,
		lazy = true,
	},

	{ "MunifTanjim/nui.nvim", lazy = true },

	{
		"folke/noice.nvim",
		config = function()
			require("configs.noice")
		end,
		event = "VeryLazy",
	},

	-- Cololizer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		cmd = { "ColorizerAttachToBuffer", "ColorizerToggle" },
	},

	---------------------
	-- Editor
	---------------------
	-- Set indent
	{
		"Darazaki/indent-o-matic",
		config = function()
			require("configs.indent-o-matic")
		end,
		lazy = true,
	},

	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {
			dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
			-- minimum number of file buffers that need to be open to save
			-- Set to 0 to always save
			need = 1,
			branch = true, -- use git branch to save session
		},
	},

	-- Terminal integration
	{
		"akinsho/nvim-toggleterm.lua",
		config = function()
			require("configs.toggleterm")
		end,
		lazy = true,
	},

	-- Start page
	{
		"goolord/alpha-nvim",
		config = function()
			require("configs.alpha-nvim")
		end,
	},

	{ "mbbill/undotree", cmd = {
		"UndotreeHide",
		"UndotreeShow",
		"UndotreeToggle",
	} },

	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("configs.scrollbar")
		end,
	},

	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()
		end,
	},

	-- {
	-- 	'tomasky/bookmarks.nvim',
	-- 	config = function()
	-- 		require('configs.bookmarks')
	-- 	end
	-- },

	--------------------
	-- Key support
	--------------------
	-- Move window by <C-h/j/k/l>
	{
		"mrjones2014/smart-splits.nvim",
		config = function()
			require("configs.smart-splits")
		end,
		lazy = true,
	},

	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
		cmd = { "HopWord" },
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	},
	-- Lua
	{
		"gbprod/substitute.nvim",
		config = function()
			require("substitute").setup({})
		end,
		lazy = true,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "xml", "jsx", "tsx" },
			})
		end,
		ft = { "html", "xml", "jsx", "tsx" },
	},

	{ "junegunn/vim-easy-align", cmd = "EazyAlign" },

	{ "monaqa/dial.nvim", lazy = true },

	--------------------
	-- LSP integration
	--------------------

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.nvim-lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("configs.mason")
		end,
		cmd = { "Mason" },
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("configs.mason-lspconfig")
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("configs.lspsaga")
		end,
		cmd = { "Lspsaga" },
	},

	{
		"mfussenegger/nvim-lint",
		-- dir = "~/ghq/github.com/mfussenegger/nvim-lint",
		config = function()
			require("configs.lint")
		end,
		ft = { "go" },
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	--------------------
	-- Complement
	--------------------
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("configs.nvim-cmp")
		end,
	},

	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			require("configs.cmp-nvim-lsp")
		end,
	},

	{
		"petertriho/cmp-git",
		config = function()
			require("configs.cmp-git")
		end,
	},

	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "onsails/lspkind.nvim" },
	{
		"mattn/vim-sonictemplate",
		config = function()
			vim.g.sonictemplate_vim_template_dir = vim.g.nvim_path .. "template"
		end,
	},

	--------------------
	-- Integration
	--------------------
	-- Translate
	{
		"skanehira/translate.vim",
		config = function()
			require("configs.translate")
		end,
		cmd = { "Translate" },
	},

	-- Git integration
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	},

	{
		"rhysd/git-messenger.vim",
		config = function()
			require("configs.git-messenger")
		end,
		cmd = { "GitMessenger" },
	},
	{
		"sindrets/diffview.nvim",
		config = function() end,
		cmd = { "DiffviewFileHistory", "DiffviewClose", "DiffviewOpen" },
	},

	{
		-- "arakkkkk/kanban.nvim",
		dir = "~/ghq/github.com/arakkkkk/kanban.nvim",
		-- dir = "~/ghq/github.com/4DRIAN0RTIZ/kanban.nvim",
		config = function()
			require("configs.kanban")
		end,
	},

	-- {
	-- 	dir = "~/ghq/github.com/arakkkkk/obsidian-kanban.nvim",
	-- },
	--
	-- { "obsidian-nvim/obsidian.nvim" },

	--------------------
	-- Markdown
	--------------------
	{
		"jakewvincent/mkdnflow.nvim",
		-- "arakkkkk/mkdnflow.nvim",
		-- rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
		-- dir = "~/Downloads/mkdnflow.nvim",
		config = function()
			require("configs.mkdnflow")
		end,
		ft = { "markdown" },
	},

	{
		"jubnzv/mdeval.nvim",
		config = function()
			vim.g.markdown_fenced_languages = { "python", "cpp", "sh", "go" }
			require("mdeval").setup()
		end,
		ft = { "markdown" },
	},

	{
		"arakkkkk/clipboard-image.nvim",
		-- dir = "~/ghq/github.com/arakkkkk/clipboard-image.nvim",
		config = function()
			require("configs.clipboard-image")
		end,
		ft = { "markdown", "vimwiki" },
	},

	-- List2Tree
	{
		"shinespark/vim-list2tree",
		ft = { "markdown" },
		cmd = { "List2Tree" },
	},

	-- cav to table
	{
		"mattn/vim-maketable",
		ft = { "markdown" },
		cmd = { "MakeTable" },
	},

	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
		cmd = { "MarkdownPreviewToggle" },
	},

	-- Others
	{
		"samodostal/image.nvim",
		config = function()
			require("configs.image")
		end,
		ft = { "markdown" },
		cmd = { "MarkdownPreviewToggle" },
	},

	{
		"folke/todo-comments.nvim",
		config = function()
			require("configs.todo-comments")
		end,
		lazy = true,
	},

	{ "rhysd/clever-f.vim" },

	-- {
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- 	config = function()
	-- 		require("configs.render-markdown")
	-- 	end,
	-- 	---@module 'render-markdown'
	-- 	---@type render.md.UserConfig
	-- 	ft = { "markdown" },
	-- },

	-- {
	-- 	"arakkkkk/textile.nvim",
	-- 	dir = "~/ghq/github.com/arakkkkk/textile.nvim",
	-- },

	-- {
	-- 	"arakkkkk/plantuml-ascii.nvim",
	-- 	-- dir = "~/ghq/github.com/arakkkkk/plantuml-ascii.nvim",
	-- 	config = function()
	-- 		require("plantuml_ascii").setup({})
	-- 	end,
	-- 	cmd = { "PlantUMLAscii" },
	-- },

	--------------------
	-- LaTeX integration
	--------------------
	{
		"lervag/vimtex",
		config = function()
			require("configs.vimtex")
		end,
		ft = { "tex" },
	},

	--------------------
	-- Others
	--------------------
	-- {
	-- 	"hrsh7th/nvim-pasta",
	-- 	config = function()
	-- 		require("configs.nvim-pasta")
	-- 	end,
	-- },

	{
		"stevearc/aerial.nvim",
		config = function()
			require("configs.aerial")
		end,
		cmd = { "AerialToggle" },
	},

	{
		"kazhala/close-buffers.nvim",
		config = function()
			require("close_buffers").setup({})
		end,
	},

	{
		"glidenote/memolist.vim",
		config = function()
			require("configs.memolist")
		end,
	},

	{
		"ShikChen/osc52.vim",
		config = function()
			if require("core.utils").getOS() == "Windows" then
				vim.api.nvim_create_augroup("osc52", {})
				vim.api.nvim_create_autocmd("TextYankPost", {
					group = "osc52",
					callback = function(event)
						vim.cmd([[if v:event.operator ==# 'y' | call SendViaOSC52(getreg(v:event.regname)) | endif]])
					end,
				})
			end
		end,
	},
}

-- Disable local-dir plugins when the directory is missing
do
	local uv = vim.uv or vim.loop
	local function path_exists(path)
		return uv.fs_stat(path) ~= nil
	end

	for _, spec in ipairs(plugins) do
		if type(spec) == "table" and type(spec.dir) == "string" then
			local original_enabled = spec.enabled
			local dir_value = spec.dir
			spec.enabled = function()
				local ok = true
				if original_enabled ~= nil then
					ok = (type(original_enabled) == "function") and original_enabled() or not not original_enabled
				end
				local p = dir_value
				if p:sub(1, 1) == "~" then
					p = vim.fn.expand(p)
				end
				return ok and path_exists(p)
			end
		end
	end
end

require("lazy").setup(plugins)
