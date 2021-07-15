" Comprueba que esta instalado el gestor de plugins
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
" Plug 'ap/vim-css-color'
Plug 'gruvbox-community/gruvbox'
Plug 'alvan/vim-closetag'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

syntax enable               " syntax highlighting
set showmode                " always show what mode we're currently editing in
set nowrap                  " don't wrap lines
filetype plugin indent on
set ts=4 sts=4 sw=4 expandtab
set autoindent
set smartindent
set listchars=space:·,tab:>~ list
set number relativenumber   " always show line relative numbers
set mouse=a
set numberwidth=1
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set noerrorbells
set clipboard=unnamed
set clipboard+=unnamedplus
set noswapfile
set path+=**               " permite hacer busquedas con el comando :find '*model.ts' por ejemplo, como fzf
set laststatus=2           " Always display the status bar
set termguicolors          " True colors in terminal
set nohlsearch             " no highlight my search with /
set hidden                 " permite moverme entre buffers sin guardar
set scrolloff=8            " cuando haces scroll deja 8 lineas de margen
set signcolumn=yes
set notimeout
set autoread
set completeopt=menuone,noselect

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:mapleader = "\<Space>"

" Quit and save
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" " NerdTree
" nmap <Leader>n :NERDTreeFind<CR>
" " Refresh
" nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

colorscheme gruvbox
set background=dark

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua require("juanal07")

" Source files automaticaly
nnoremap <F5> :source ~/.config/nvim/init.vim<cr>

" NVIM TREE LUA
" let g:nvim_tree_icons = {
"     \ 'default': '',
"     \ 'symlink': '',
"     \ 'git': {
"     \   'unstaged': "✗",
"     \   'staged': "✓",
"     \   'unmerged': "",
"     \   'renamed': "➜",
"     \   'untracked': "★",
"     \   'deleted': "",
"     \   'ignored': "◌"
"     \   },
"     \ 'folder': {
"     \   'arrow_open': "",
"     \   'arrow_closed': "",
"     \   'default': "",
"     \   'open': "",
"     \   'empty': "",
"     \   'empty_open': "",
"     \   'symlink': "",
"     \   'symlink_open': "",
"     \   },
"     \   'lsp': {
"     \     'hint': "",
"     \     'info': "",
"     \     'warning': "",
"     \     'error': "",
"     \   }
"     \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
