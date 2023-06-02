require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },

	---------------------
	-- File exploler
	---------------------
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("configs.nvim-tree")
		end,
	},
	---------------------
	-- Telescope
	---------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-fzf-native.nvim",
				"FeiyouG/command_center.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
				"nvim-telescope/telescope-live-grep-args.nvim",
			},
		},
		config = function()
			require("configs.telescope")
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
		},
		config = function()
			require("configs.neoclip")
		end,
	},
	{
		"/arakkkkk/marktodo.nvim",
		config = function()
			require("configs.marktodo")
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "kkharji/sqlite.lua" },
	},

	---------------------
	-- Theme
	---------------------
	-- theme
	{ "arcticicestudio/nord-vim" },
	{ "projekt0n/github-nvim-theme" },

	-- tab
	{ "lukas-reineke/indent-blankline.nvim" },

	{ "famiu/bufdelete.nvim" },

	{
		"akinsho/bufferline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("configs.bufferline")
		end,
	},

	{ "arkav/lualine-lsp-progress" },

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("configs.lualine")
		end,
	},

	{
		"declancm/cinnamon.nvim",
		config = function()
			require("cinnamon").setup()
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter")
		end,
	},

	{
		"folke/noice.nvim",
		config = function()
			require("configs.noice")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {},
	},

	{ "p00f/nvim-ts-rainbow" },

	-- Cololizer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
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
	},

	-- Session manager
	{
		"Shatur/neovim-session-manager",
		config = function()
			require("configs.session-manager")
		end,
	},

	-- Terminal integration
	{
		"akinsho/nvim-toggleterm.lua",
		config = function()
			require("configs.toggleterm")
		end,
	},

	-- Start page
	{
		"goolord/alpha-nvim",
		config = function()
			require("configs.alpha-nvim")
		end,
	},

	{ "mbbill/undotree" },

	{
		"sidebar-nvim/sidebar.nvim",
		config = function()
			require("configs.sidebar")
		end,
	},

	-- {
	-- 	"~/Downloads/switchpanel.nvim",
	-- 	config = function()
	-- 		require("switchpanel").setup({})
	-- 	end,
	-- })

	--------------------
	-- Key support
	--------------------
	-- Move window by <C-h/j/k/l>
	{
		"mrjones2014/smart-splits.nvim",
		config = function()
			require("configs.smart-splits")
		end,
	},

	{
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
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
			require("configs.substitute")
		end,
	},
	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("configs.eyeliner")
		end,
	},

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
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason-lspconfig")
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.null-ls")
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

	{
		"arakkkkk/cmp-builder",
		dependencies = { "hrsh7th/nvim-cmp", "kyoh86/vim-ripgrep" },
	},
	{ "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
	{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
	{ "hrsh7th/cmp-path", after = "nvim-cmp", dependencies = { "hrsh7th/cmp-vsnip" } },
	{ "hrsh7th/vim-vsnip", after = "nvim-cmp" },
	{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
	{ "onsails/lspkind.nvim", after = "nvim-cmp" },

	--------------------
	-- Integration
	--------------------
	-- Translate
	{
		"skanehira/translate.vim",
		config = function()
			require("configs.translate")
		end,
	},

	-- Git integration
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	},

	{
		-- "arakkkkk/kanban.nvim",
		dir = "~/ghq/github.com/arakkkkk/kanban.nvim",
		config = function()
			require("configs.kanban")
		end,
	},

	--------------------
	-- Markdown
	--------------------
	{
		-- "jakewvincent/mkdnflow.nvim",
		-- rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
		dir = "~/ghq/github.com/arakkkkk/mkdnflow.nvim",
		config = function()
			require("configs.mkdnflow")
		end,
		ft = { "markdown" },
	},
	-- {
	-- 	"preservim/vim-markdown",
	-- 	dependencies = {
	-- 		"godlygeek/tabular",
	-- 	},
	-- 	config = function()
	-- 		require("configs.vim-markdown")
	-- 	end,
	-- 	ft = { "markdown" },
	-- })

	{
		"ekickx/clipboard-image.nvim",
		config = function()
			require("configs.clipboard-image")
		end,
		ft = { "markdown" },
	},

	-- List2Tree
	{
		"shinespark/vim-list2tree",
		ft = { "markdown" },
	},

	-- cav to table
	{ "mattn/vim-maketable" },

	{
		"toppair/peek.nvim",
		run = "deno task --quiet build:fast",
		config = function()
			require("configs.peek")
		end,
		ft = { "markdown" },
	},

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

	-- Others
	{
		"samodostal/image.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("configs.image")
		end,
	},

	--------------------
	-- Others
	--------------------
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("configs.todo-comments")
		end,
	},

	{
		"stevearc/aerial.nvim",
		config = function()
			require("configs.aerial")
		end,
	},

	{
		"kazhala/close-buffers.nvim",
		config = function()
			require("close_buffers").setup({})
		end,
	},

	{
		"mattn/vim-sonictemplate",
		config = function()
			vim.g.sonictemplate_vim_template_dir = vim.g.nvim_path .. "template"
		end,
	},

	{ "junegunn/vim-easy-align" },
})
