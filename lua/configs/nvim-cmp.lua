-- require("cmp-builder").add(
-- 	{ "\\\\label\\{[^\\}]+\\}" },
-- 	"tex_ref",
-- 	{ ".", "\\" },
-- 	"-ttex",
-- 	{ before = "label", after = "ref" }
-- )
-- require("cmp-builder").add(
-- 	{ "@[Aa]rticle\\{[a-zA-Z0-9_-]+," },
-- 	"tex_cite",
-- 	{ ".", "\\" },
-- 	"-U -ttex",
-- 	{ before = "@[Aa]rticle%{([a-zA-Z0-9_-]+),", after = "\\cite{%1}" }
-- )

local cmp = require("cmp")
local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local sorting = {
	comparators = {
		cmp.config.compare.recently_used,
		cmp.config.compare.offset,
		cmp.config.compare.exact,
		cmp.config.compare.score,
		cmp.config.compare.locality,
		cmp.config.compare.kind,
		cmp.config.compare.sort_text,
		cmp.config.compare.length,
		cmp.config.compare.order,
	},
}
cmp.setup({
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    " .. "[" .. entry.source.name .. "]" .. " " .. strings[2] .. ""
			return kind
		end,
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	sources = {
		{ name = "vsnip" },
		{ name = "nvim_lsp" },
		{ name = "git" },
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
		{
			name = "path",
			option = {
				get_cwd = function()
					-- return "./"
					return vim.fn.expand("%:h")
				end,
			},
		},
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
			keyword_length = 1,
		},

		-- { name = "neoclip", keyword_length = 5 },
		-- { name = "tex_ref" },
		-- { name = "tex_cite" },
		-- { name = "marktodo" },
	},
	sorting = sorting,
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function()
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			end
		end, { "i", "s" }),
	}),
	experimental = {
		ghost_text = true,
	},
})
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sorting = sorting,
	sources = {
		{ name = "buffer" },
		{ name = "mdtags" },
	},
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sorting = sorting,
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
})
