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
		-- tag = "0.1.5",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-fzf-native.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
				"nvim-telescope/telescope-live-grep-args.nvim",
				"arakkkkk/telescope-sonictemplate.nvim",
				"arakkkkk/telescope-memolist.nvim",
			},
		},
		config = function()
			require("configs.telescope")
		end,
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
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("configs.lualine")
		end,
	},

	{
		"declancm/cinnamon.nvim",
		config = function()
			require("configs.cinnamon")
		end,
	},

	{
		"folke/noice.nvim",
		config = function()
			require("configs.noice")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- "rcarriga/nvim-notify",
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
			require("scrollbar.handlers.search").setup()
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
			require("substitute").setup({})
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "xml", "jsx", "tsx" },
			})
		end,
	},

	{
		"rhysd/clever-f.vim",
		config = function() end,
	},

	{ "junegunn/vim-easy-align" },

	{ "monaqa/dial.nvim" },

	--------------------
	-- LSP integration
	--------------------
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("configs.mason")
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("configs.mason-lspconfig")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.nvim-lspconfig")
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("configs.lspsaga")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		-- dir = "~/ghq/github.com/mfussenegger/nvim-lint",
		config = function()
			require("configs.lint")
		end,
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

	{
		"arakkkkk/cmp-builder",
		dependencies = { "hrsh7th/nvim-cmp", "kyoh86/vim-ripgrep" },
	},

	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path", dependencies = { "hrsh7th/cmp-vsnip" } },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
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
	},
	{
		"sindrets/diffview.nvim",
		config = function() end,
	},

	-- {
	-- 	-- "arakkkkk/kanban.nvim",
	-- 	dir = "~/ghq/github.com/arakkkkk/kanban.nvim",
	-- 	config = function()
	-- 		require("configs.kanban")
	-- 	end,
	-- },

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

	-- {
	-- 	"vimwiki/vimwiki",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("configs.vimwiki")
	-- 	end,
	-- 	-- ft = { "markdown" },
	-- },

	-- {
	-- 	"preservim/vim-markdown",
	-- 	dependencies = {
	-- 		"godlygeek/tabular",
	-- 	},
	-- 	config = function()
	-- 		require("configs.vim-markdown")
	-- 	end,
	-- },

	{
		"postfen/clipboard-image.nvim",
		config = function()
			require("configs.clipboard-image")
		end,
		ft = { "markdown", "vimwiki" },
	},

	-- List2Tree
	{
		"shinespark/vim-list2tree",
		ft = { "markdown" },
	},

	-- cav to table
	{
		"mattn/vim-maketable",
		ft = { "markdown" },
	},

	-- {
	-- 	"toppair/peek.nvim",
	-- 	event = { "VeryLazy" },
	-- 	build = "deno task --quiet build:fast",
	-- 	config = function()
	-- 		require("configs.peek")
	-- 	end,
	-- 	ft = { "markdown" },
	-- },

	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
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
		ft = { "markdown", "tex" },
	},

	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("configs.todo-comments")
		end,
		ft = { "markdown", "vimwiki" },
	},

	{
		"arakkkkk/textile.nvim",
		-- dir = "~/ghq/github.com/arakkkkk/textile.nvim",
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
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
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
})
