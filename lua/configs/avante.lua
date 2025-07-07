require("avante").setup({
	---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
	provider = "copilot",

	hints = { enabled = false },
	behaviour = {
		auto_suggestions = false, -- Experimental stage
		auto_set_highlight_group = true,
		aauto_set_keymaps = false,
		auto_apply_diff_after_generation = false,
		support_paste_from_clipboard = false,
		minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
		enable_token_counting = true, -- Whether to enable token counting. Default to true.
		auto_approve_tool_permissions = false, -- Default: show permission prompts for all tools
		-- Examples:
		-- auto_approve_tool_permissions = true,                -- Auto-approve all tools (no prompts)
		-- auto_approve_tool_permissions = {"bash", "replace_in_file"}, -- Auto-approve specific tools only
	},
})
