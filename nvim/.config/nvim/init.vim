if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
" Utils
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'numToStr/Comment.nvim'
Plug 'folke/which-key.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'TovarishFin/vim-solidity'
Plug 'mhartington/formatter.nvim'
" GUI
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'norcalli/nvim-colorizer.lua'
" LSP completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'onsails/lspkind-nvim'

" Investigar
" mfussenegger/nvim-lint
" https://github.com/nvim-telescope/telescope-media-files.nvim
" https://github.com/glepnir/dashboard-nvim
" TimUntersberger/neogit
" Plug 'glepnir/lspsaga.nvim'
" https://github.com/iamcco/markdown-preview.nvim
call plug#end()

filetype plugin indent on
syntax enable               " syntax highlighting
set timeoutlen=250
set termguicolors          " True colors in terminal
set nobackup
set nowritebackup
set showmode                " always show what mode we're currently editing in
set ts=2 sts=2 sw=2 expandtab
set autoindent
set smartindent
set list
set listchars=tab:>~,trail:·
" set listchars=space:·,tab:>~,eol:↲
" set listchars=eol:↲
set number relativenumber   " always show line relative numbers
set mouse=a
set numberwidth=1
set nowrap                  " don't wrap lines
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set noerrorbells
set clipboard=unnamedplus
" set clipboard+=unnamedplus
set noswapfile
" set path+=**               " permite hacer busquedas con el comando :find '*model.ts' por ejemplo, como fzf
set laststatus=2           " Always display the status bar
set ignorecase
set hidden                 " permite moverme entre buffers sin guardar
set scrolloff=8            " cuando haces scroll deja 8 lineas de margen
set signcolumn=yes
set autoread
set nocompatible 
set incsearch
set hlsearch
set completeopt=menu,menuone,noselect

let mapleader = " "
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>k :nohlsearch<cr>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader><Leader> <c-^>
nnoremap n nzzzv
nnoremap N Nzzzv
vnoremap < <gd
vnoremap > >gv
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-k> <esc>:m .-2<CR>==
inoremap <C-j> <esc>:m .+1<CR>==
nnoremap <leader>e ggVG<CR>

lua << EOF
require'plugins'
require'colorizer'.setup()
require'Comment'.setup()
require'telescope'.setup{}
require'telescope'.load_extension('fzf')
require'nvim-web-devicons'.setup {
    default = true;
}
EOF

" Plugins options
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

