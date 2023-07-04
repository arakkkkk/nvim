utils = require("core.utils")

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

vim.g.hostos = utils.getOS()
if vim.g.hostos == "Windows" then
  vim.g.nvim_path = "~/AppData/Local/"
  vim.g.note_path = "~/Note/"
  vim.g.vsnip_snippet_dir = vim.g.nvim_path .. "snippets"
else
  vim.g.nvim_path = string.gsub("~/.config/nvim/", "^~", os.getenv("HOME"))
  vim.g.note_path = string.gsub("~/Note/", "^~", os.getenv("HOME"))
  vim.g.vsnip_snippet_dir = vim.g.nvim_path .. "snippets"
end
