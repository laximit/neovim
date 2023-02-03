require('telescope').setup{
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".git",
			"autoload",
		},
		layout_strategy = 'vertical',
		prompt_prefix = '',
		results_title = 'Files',
		preview = false,
		layout_config = {
			vertical = {
				height = 0.4,
				prompt_position = 'top',
				width = 0.6,
			},
		},
	}
}
