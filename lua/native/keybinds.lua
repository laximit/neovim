set_keymap = vim.api.nvim_set_keymap

set_keymap('n', 'qq', ':q<Return>', {noremap = false, silent = true})
set_keymap('n', 'ww', ':w<Return>', {noremap = false, silent = true})
set_keymap('n', 'wq', ':wq<Return>', {noremap = false, silent = true})
set_keymap('n', '<C-f>', ':NvimTreeToggle<Return>', {noremap = true, silent = true})
set_keymap('n', 'ee', ':Telescope find_files<Return>', {noremap = false, silent = true})
set_keymap('n', 'bb', ':Telescope buffers<Return>', {noremap = false, silent = true})
set_keymap('n', 'ss', ':split<Return>', {noremap = false, silent = true})
set_keymap('n', 'sv', ':vsplit<Return>', {noremap = false, silent = true})
