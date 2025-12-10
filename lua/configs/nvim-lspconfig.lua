local nvim_lsp = vim.lsp.config

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

-- Python: pyright
do
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if ok_cmp then
		capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
	end

	-- Try to respect project venv automatically
	local function detect_python()
		local uv = vim.uv or vim.loop
		local cwd = vim.fn.getcwd()
		local candidates = {
			cwd .. "/.venv/bin/python",
			cwd .. "/venv/bin/python",
			cwd .. "/.tox/venv/bin/python",
			"python3",
			"python",
		}
		for _, p in ipairs(candidates) do
			if uv.fs_stat(p) then
				return p
			end
		end
		return "python3"
	end

	-- nvim_lsp.pyright.setup({
	-- 	capabilities = capabilities,
	-- 	settings = {
	-- 		python = {
	-- 			pythonPath = detect_python(),
	-- 			analysis = {
	-- 				typeCheckingMode = "basic",
	-- 				autoImportCompletions = true,
	-- 				useLibraryCodeForTypes = true,
	-- 			},
	-- 		},
	-- 	},
	-- })
end

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
