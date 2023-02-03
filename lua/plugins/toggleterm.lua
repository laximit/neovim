local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
	size = 10,
	open_mapping = [[<C-j>]],
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = 'horizontal',
	close_on_exit = true,
	shell = 'powershell -nologo',
	auto_scroll = true,
	float_opts = {
		border = 'curved',
	},
}
