vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	sort_by = 'name',
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
		add_trailing = true,
	},
	filters = {
		dotfiles = true,
	},
	hijack_unnamed_buffer_when_opening = true,
	diagnostics = {
		enable = true,
	},
})
