for _, source in ipairs({
	"core.options",
	"core.config",
	"core.plugins",

	"core.utils",
	"core.mappings",
	"core.autocmd",

	"theme.init",
	"mymods.init",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		error("Failed to load " .. source .. "\n\n" .. fault)
	end
end
