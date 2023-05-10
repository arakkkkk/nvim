require("marktodo").setup({
	exclude_ops = "-g '!*Kanban.md'",
	sort = { "priority", "project_tags", "completion" }, -- last is precedence

	default_root_path = vim.g.note_path,
	columns = {
		require("marktodo.view.column_set").status({ order = 1 }),
		require("marktodo.view.column_set").priority({ order = 2 }),
		{ label = "description", order = 3, max_width = vim.o.columns / 5 },
		require("marktodo.view.column_set").projects({ order = 4 }),
		require("marktodo.view.column_set").contexts({ order = 5 }),
		require("marktodo.view.column_set").due_day_count({ order = 6 }),
	},
	separator = "   ",
})
