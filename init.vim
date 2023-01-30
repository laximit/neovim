call plug#begin('C:/Users/Murilo/AppData/Local/nvim/autoload/plugged')

" Nvim Tree // File Explorer and Icons
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'

" ALE // Syntax Checking and Semantic Errors
    Plug 'dense-analysis/ale'

" Gitgutter // Provides git diff inline
    Plug 'airblade/vim-gitgutter'

" Vim Rainbow // Color the Brackets
    Plug 'frazrepo/vim-rainbow'

" Auto Pairs // Auto close the brackets, parens and quotes
    Plug 'jiangmiao/auto-pairs'

" Vim Commentary // Comment a line with a command
    Plug 'tpope/vim-commentary'

" Code of Completion // Intellisense for different languages
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Markdown Preview // Create a host for previewing markdown
    Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app; yarn install'}

" Airline // Customizable Statusbar and Themes
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

" Splitjoin // Hide or show expression
    Plug 'AndrewRadev/splitjoin.vim'

" Telescope // Open a file from any subfolder 
    Plug 'nvim-telescope/telescope.nvim'

" Nvim Web Devicons // ASCII icons for nvim
    Plug 'kyazdani42/nvim-web-devicons'

" BarBar // Buffer bar indicator
    Plug 'romgrk/barbar.nvim'

" Nvim Colorizer // Show the color on the color text (HEX or Specified Text)
    Plug 'norcalli/nvim-colorizer.lua'

" Vista // Quickly find tags and functions on a sidebar
    Plug 'liuchengxu/vista.vim'

" LSPConfig - LSPSaga - Vim Javascript - Vim Typescript - Vim JSX TS // Autocomplete multiple languages
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'

" Vim Styled Components // Autocomplete CSS Styled Components
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" COC Jedi // COC wrapper for Python jedi-language-server
    Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile; yarn build', 'branch': 'main' }

" Dashboard // Start Page for Neovim
    Plug 'glepnir/dashboard-nvim'

" Blamer // Show line last commit
    Plug 'APZelos/blamer.nvim'

" Nord Vim // Add Nord theme
    Plug 'arcticicestudio/nord-vim'
	
" Plenary // Lua module for asynchronous programming using coroutines
    Plug 'nvim-lua/plenary.nvim'

call plug#end()

" -- NATIVE --

language en-US
set noshowmode
set mouse=a
set tabstop=2
set softtabstop=0
set shiftwidth=2
set smarttab
set encoding=utf-8
set wrap
set linebreak
set laststatus=2
set ruler
set number
set cursorline
set noerrorbells
set confirm
set history=1000
set noswapfile
set hlsearch
set splitbelow
set splitright
set guifont=JetBrainsMono\ NF:h9

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme nord

au VimEnter * syntax on

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" -- KEYBINDS --

nnoremap <A-w> :BufferClose <CR>
nnoremap <Tab> :BufferNext <CR>
nnoremap <S-Tab> :BufferPrevious <CR>
nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <C-f> :Vista!! <CR>
nnoremap <silent> <space>d :<C-u>CocList diagnostics<CR>
nnoremap <C-j> :split term://powershell <bar> resize 5<CR>

nmap ee <cmd>Telescope find_files<cr>
nmap b <cmd>Telescope buffers<cr>

nmap ss :split<Return>
nmap sv :vsplit<Return>

nmap qq :q<Return>
nmap ww :w<Return>
nmap wq :wq<Return>

" -- AIRLINE -- 

let g:airline_extensions = ['branch', 'coc']
let g:airline#extensions#coc#error_symbol = 'E:'
let g:airline#extensions#coc#warning_symbol = 'W:'
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_err = '%E{[%w(#%fw)]}'
let g:airline#extensions#branch#empty_message = 'none'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline_theme = 'base16_nord'
let g:airline_symbols_ascii = 1

" -- ALE --

let b:ale_fixers = ['prettier', 'eslint']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" -- BARBAR --

let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'both'
let bufferline.insert_at_start = 'false'
let bufferline.insert_at_end = 'true'
let bufferline.maximum_padding = 5

" -- BLAMER --

let g:blamer_enabled = 1
let g:blamer_template = '<committer-time> <committer> <summary>'
let g:blamer_delay = 200

" -- COC --

let g:coc_global_extensions = [
    \  'coc-emmet',
    \  'coc-html',
    \  'coc-css',
    \  'coc-json',
    \  'coc-yaml',
    \  'coc-eslint',
    \  'coc-jedi',
    \  'coc-tsserver'
    \  ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./mode_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

autocmd CursorHold * silent call CocActionAsync('highlight')
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" -- DASHBOARD --

let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]

" -- GITGUTTER --

au VimEnter * GitGutterEnable

" -- NVIMTREE --

lua<<EOF
  require'nvim-tree'.setup {}
EOF

let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \ 'unstaged': "✗",
    \ 'staged': "✓",
    \ 'unmerged': "",
    \ 'renamed': "➜",
    \ 'untracked': "★",
    \ 'deleted': "",
    \ 'ignored': "◌"
    \ },
    \ 'folder': {
    \ 'arrow_open': "",
    \ 'arrow_closed': "",
    \ 'default': "",
    \ 'open': "",
    \ 'empty': "",
    \ 'empty_open': "",
    \ 'symlink': "",
    \ 'symlink_open': "",
    \ }
    \ }

" -- RAINBOW --

let g:rainbow_active = 1

" -- TELESCOPE --

lua<<EOF
  require('telescope').setup({
    defaults = {
      layout_strategy = 'vertical',
      layout_config = {
        width=0.4
      },
      borderchars = {
        "─",
        "│",
        "─",
        "│",
        "╭",
        "╮",
        "╯",
        "╰",
      },
      dynamic_preview_title = true,
      file_ignore_patterns = {
        "node%_modules/.*",
        "plugged/*",
        "*.png",
        "*.jpg",
        "*.jpeg",
        "*.ico"
      };
    },
  })
EOF
