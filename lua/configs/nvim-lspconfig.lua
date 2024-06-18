local nvim_lsp = require("lspconfig")

require("lspconfig")
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

nvim_lsp.html.setup({
	filetypes = { "html", "htmldjango" },
})

vim.diagnostic.config({
	virtual_text = true,
	signs = { active = signs },
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		-- vim.keymap.set("n", "<space>fm", function()
		-- 	vim.lsp.buf.format({ async = true })
		-- end, opts)
	end,
})

-- nvim_lsp.my_lsp_server = {
-- 	default_config = {
-- 		cmd = { "python", "~/Downloads/lsp-textile/lsp-textile.py" },
-- 		filetypes = { "plaintext" },
-- 		root_dir = function(fname)
-- 			return vim.loop.cwd()
-- 		end,
-- 		settings = {},
-- 	},
-- }
-- nvim_lsp.my_lsp_server.setup({})

-- Create an event handler for the FileType autocommand
-- vim.api.nvim_create_autocmd("FileType", {
-- 	-- This handler will fire when the buffer's 'filetype' is "python"
-- 	pattern = "textile",
-- 	callback = function(ev)
-- 		vim.lsp.start({
-- 			name = "lsp-textile",
-- 			cmd = { "python", "/home/arakkk/Downloads/lsp-textile/lsp-textile.py" },
-- 			-- Set the "root directory" to the parent directory of the file in the
-- 			-- current buffer (`ev.buf`) that contains either a "setup.py" or a
-- 			-- "pyproject.toml" file. Files that share a root directory will reuse
-- 			-- the connection to the same LSP server.
-- 			root_dir = vim.fn.getcwd(), -- Use PWD as project root dir.
-- 		})
-- 	end,
-- })

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

if not configs.textilels then
	configs.textilels = {
		default_config = {
			-- cmd = { "nargo", "lsp" },
			cmd = { "textilels" },
			-- cmd = { "python", "/home/arakkk/Downloads/lsp-textile/pygls/lsp-textile.py" },
			root_dir = lspconfig.util.root_pattern("*"),
			-- root_dir = vim.fn.getcwd(), -- Use PWD as project root dir.
			filetypes = { "textile" },
		},
	}
end
lspconfig.textilels.setup({})
