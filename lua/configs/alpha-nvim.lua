local dashboard = require("alpha.themes.dashboard")
local alpha_button = dashboard.button
require('alpha').setup({
  layout = {
    { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
    {
      type = "text",
      val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      },
      opts = { position = "center", hl = "DashboardHeader" },
    },
    { type = "padding", val = 5 },
    {
      type = "group",
      val = {
        alpha_button("LDR S l", "  Load Session  ", "<cmd>SessionManager! load_current_dir_session<CR>"),
        alpha_button("LDR S f", "  Finder  ", "<cmd>e .<CR>"),
        alpha_button("LDR f f", "  Find File  ", "<leader>ff<cr>"),
        alpha_button("LDR f o", "  Recents  ", "<leader>fo<cr>"),
        alpha_button("LDR f w", "  Find Grep  ", "<leader>fg<cr>"),
        alpha_button("LDR t t", "  Taks  ", "<leader>tt<cr>"),
      },
      opts = { spacing = 1 },
    },
  },
  opts = {},
})
