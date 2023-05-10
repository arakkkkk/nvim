local source = {}
---Return whether this source is available in the current context or not (optional).
---@return boolean
function source:is_available()
	return true
end
---Return the debug name of this source (optional).
---@return string
function source:get_debug_name()
	return "neoclip"
end
---Return trigger characters for triggering completion (optional).
function source:get_trigger_characters()
	return { ".." }
end
---Invoke completion (required).
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
local function list_yanks()
	local cmp_tbl = {}
	local yank_tbl = require("neoclip.storage").as_tbl()["yanks"]
	for _, yank in pairs(yank_tbl) do
		local contents = yank["contents"]
		if #contents == 1 then
			local content = string.gsub(contents[1], "^%s+", "")
			cmp_tbl[content] = true
		end
	end
	local yanks = {}
	for yank in pairs(cmp_tbl) do
		table.insert(yanks, { label = yank })
	end
	return yanks
end
function source:complete(params, callback)
	callback(list_yanks())
end
---Resolve completion item (optional). This is called right before the completion is about to be displayed.
---Useful for setting the text shown in the documentation window (`completion_item.documentation`).
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:resolve(completion_item, callback)
	callback(completion_item)
end
---Executed after the item was selected.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:execute(completion_item, callback)
	callback(completion_item)
end
---Register your source to nvim-cmp.
require("cmp").register_source("neoclip", source)
