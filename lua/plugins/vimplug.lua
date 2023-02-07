vim.opt.termguicolors = true
local Plug = vim.fn['plug#']

vim.call('plug#begin', 'C:/Users/Murilo/AppData/Local/nvim/autoload/plugged')

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'dense-analysis/ale'
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug ('neoclide/coc.nvim', {branch = 'release'})
Plug ('pappasam/coc-jedi', {branch = 'release'})
Plug 'arcticicestudio/nord-vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug ('akinsho/toggleterm.nvim', {tag = '*'})
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'

vim.call('plug#end')
