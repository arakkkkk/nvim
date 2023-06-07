-- Check supported formatters
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = require("null-ls").builtins.formatting

-- Check supported linters
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = require("null-ls").builtins.diagnostics

local null_ls = require("null-ls")
null_ls.setup({
	debug = false,
	sources = {
		-- Set a formatter
		formatting.prettier,
		formatting.eslint_d,
		formatting.fixjson,
		formatting.clang_format,
		formatting.eslint_d,
		formatting.black,
		formatting.stylua,
	},
	-- NOTE: You can remove this on attach function to disable format on save
	-- on_attach = function(client)
	--   if client.resolved_capabilities.document_formatting then
	--     vim.api.nvim_create_autocmd("BufWritePre", {
	--       desc = "Auto format before save",
	--       pattern = "<buffer>",
	--       callback = vim.lsp.buf.formatting_sync,
	--     })
	--   end
	-- end,
})
