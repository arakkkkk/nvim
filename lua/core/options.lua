vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- vim.o.shell = "/bin/bash"
vim.o.clipboard = "unnamedplus" -- Connection to the system clipboard
vim.o.copyindent = true -- Copy the previous indentation on autoindenting
vim.o.cursorline = true -- Highlight the text line of the cursor
vim.o.expandtab = true -- Enable the use of space in tab
vim.o.fileencoding = "utf-8" -- File content encoding for the buffer
vim.o.history = 100 -- Number of commands to remember in a history table
vim.o.ignorecase = true -- Case insensitive searching
vim.o.laststatus = 3 -- globalstatus
vim.o.lazyredraw = true -- lazily redraw screen
vim.o.mouse = false -- Enable mouse support
vim.o.number = true -- Show numberline
vim.o.preserveindent = true -- Preserve indent structure as much as possible
vim.o.pumheight = 10 -- Height of the pop up menu
vim.o.relativenumber = false -- Show relative numberline
vim.o.scrolloff = 8 -- Number of lines to keep above and below the cursor
vim.o.shiftwidth = 2 -- Number of space inserted for indentation
vim.o.showmode = false -- Disable showing modes in command line
vim.o.sidescrolloff = 8 -- Number of columns to keep at the sides of the cursor
vim.o.signcolumn = "yes" -- Always show the sign column
vim.o.smartcase = true -- Case sensitivie searching
vim.o.splitbelow = true -- Splitting a new window below the current one
vim.o.splitright = true -- Splitting a new window at the right of the current one
vim.o.swapfile = false -- Disable use of swapfile for the buffer
vim.o.tabstop = 2 -- Number of space in a tab
vim.o.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.o.timeoutlen = 300 -- Length of time to wait for a mapped sequence
vim.o.undofile = true -- Enable persistent undo
vim.o.updatetime = 300 -- Length of time to wait before triggering the plugin
vim.o.wrap = false -- Disable wrapping of lines longer than the width of window
-- vim.opt.textwidth = 120
vim.o.writebackup = false -- Disable making a backup before overwriting a file

-- vim.opt.guifont = { "Source Code Pro", "h20" }
vim.opt.formatoptions:remove("t")
vim.opt.formatoptions:append("mM")
-- vim.opt.ambiwidth = 'double'
-- local cellwidths = vim.fn.getcellwidths()
-- -- Unicode Standard Miscellaneous Symbols
-- table.insert(cellwidths, { 0x2600, 0x26ff, 1 })
-- -- Seti-UI + Custom
-- table.insert(cellwidths, { 0xe5fa, 0xe6ac, 1 })
-- -- Devicons
-- table.insert(cellwidths, { 0xe700, 0xe7c5, 1 })
-- -- Font Awesome
-- table.insert(cellwidths, { 0xf000, 0xf2e0, 1 })
-- -- Font Awesome Extension
-- table.insert(cellwidths, { 0xe200, 0xe2a9, 1 })
-- -- Material Design Icons
-- table.insert(cellwidths, { 0xf0001, 0xf1af0, 1 })
-- -- Weather
-- table.insert(cellwidths, { 0xe300, 0xe3e3, 1 })
-- -- Octicons
-- table.insert(cellwidths, { 0xf400, 0xf532, 1 })
-- -- Powerline Symbols
-- table.insert(cellwidths, { 0xe0a0, 0xe0a2, 1 })
-- table.insert(cellwidths, { 0xe0b0, 0xe0b3, 1 })
-- -- Powerline Extra Symbols
-- table.insert(cellwidths, { 0xe0a3, 0xe0a3, 1 })
-- table.insert(cellwidths, { 0xe0b4, 0xe0c8, 1 })
-- table.insert(cellwidths, { 0xe0ca, 0xe0ca, 1 })
-- table.insert(cellwidths, { 0xe0cc, 0xe0d4, 1 })
-- -- IEC Power Symbols
-- table.insert(cellwidths, { 0x23fb, 0x23fe, 1 })
-- table.insert(cellwidths, { 0x2b58, 0x2b58, 1 })
-- -- Font Logos
-- table.insert(cellwidths, { 0xf300, 0xf32f, 1 })
-- -- Pomicons
-- table.insert(cellwidths, { 0xe000, 0xe00a, 1 })
-- -- Codicons
-- table.insert(cellwidths, { 0xea60, 0xebeb, 1 })
-- -- Heavy Angle Brackets
-- table.insert(cellwidths, { 0x276c, 0x2771, 1 })
-- -- Box Drawing
-- table.insert(cellwidths, { 0x2500, 0x259f, 1 })
-- vim.fn.setcellwidths(cellwidths)


vim.g.nvim_path = string.gsub("~/.config/nvim/", "^~", os.getenv("HOME"))
vim.g.note_path = string.gsub("~/Note/", "^~", os.getenv("HOME"))
vim.g.vsnip_snippet_dir = vim.g.nvim_path .. "snippets"


