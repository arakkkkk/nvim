require("kanban").setup({
	markdown = {
		title_style = "<title>",
		hl = {
			{
				name = "KanbanFloat",
				ops = { bg = "None" },
			},
			{
				name = "ListFloat",
				ops = { bg = "None" },
			},
			{
				name = "TaskFloat",
				ops = { bg = "None" },
			},
		},
		default_lists = {
			{ title = "TODO", tasks = {} },
			{ title = "Work in progress", tasks = {} },
			{ title = "Done", tasks = {} },
			{ titles = "Archiveiii", tasks = {} },
		},
	},
})
-- require("kanban").setup()
