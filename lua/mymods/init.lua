local abs_path = "mymods."
for _, source in ipairs({
	"cmp-neoclip",
	"auto-web-title",
	"fcit"
	-- "telescope-uploads"
	-- "cmp-marktodo",








}) do
	local status_ok, fault = pcall(require, abs_path .. source)
	if not status_ok then
		error("Failed to load " .. source .. "\n\n" .. fault)
	end
end

