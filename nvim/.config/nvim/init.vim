" Comprueba que esta instalado el gestor de plugins
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'numToStr/Comment.nvim'
Plug 'folke/which-key.nvim'

" GUI
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

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

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mhartington/formatter.nvim'
Plug 'TovarishFin/vim-solidity'

" Investigar
" https://github.com/nvim-telescope/telescope-media-files.nvim
" https://github.com/glepnir/dashboard-nvim
"TimUntersberger/neogit

call plug#end()

filetype plugin indent on
syntax enable               " syntax highlighting
set timeoutlen=500
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
set clipboard=unnamed
set clipboard+=unnamedplus
set noswapfile
set path+=**               " permite hacer busquedas con el comando :find '*model.ts' por ejemplo, como fzf
set laststatus=2           " Always display the status bar
" set nohlsearch             " no highlight my search with /
set ignorecase
set hidden                 " permite moverme entre buffers sin guardar
set scrolloff=8            " cuando haces scroll deja 8 lineas de margen
set signcolumn=yes
set autoread
set completeopt=menuone,noselect
set nocompatible 
" set cursorline
set incsearch
set hlsearch


let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
let mapleader = " "
" Quit and save
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>k :nohlsearch<cr>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
vnoremap < <gd
vnoremap > >gv
nnoremap <Leader><Leader> <c-^>
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz
nnoremap Y y$

" inoremap , ,<c-g>u
" inoremap . .<c-g>u
" inoremap ( (<c-g>u
" inoremap { {<c-g>u

" inoremap <C-j> <esc>:m .+1<CR>==
" inoremap <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE
" hi Visual guifg=NONE guibg=#928374 gui=NONE

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>

" --------FORMAT-------------------------

" Esto da errores en otros tipo de archivos
" autocmd FileType javascriptreact setlocal commentstring={/*\ %s\ */}

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
" nnoremap <leader>, :Neoformat<cr>

" let b:ale_fixers = {'javascript': ['prettier']}
" let g:ale_fix_on_save = 1
" let g:ale_disable_lsp = 1

"-------------------------------------LUA----------------------------------------------------------
lua << EOF
require'plugins'
require'colorizer'.setup()
require'Comment'.setup()
require'telescope'.setup{}
require'telescope'.load_extension('fzf')
require'nvim-web-devicons'.setup {
    default = true;
}

-- CMP
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  formatting = {
  format = require("lspkind").cmp_format({with_text = true, menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      path = "[Path]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Latex]",
  })}),
  experimental = {
    native_menu = false,
    ghost_text = true,
  }
},

}

-- LENGUAJES 
-- instalar:
-- npm i -g bash-language-server

-- vim
require'lspconfig'.vimls.setup{}
-- java
require'lspconfig'.java_language_server.setup{}
-- c,c++, etc.
require'lspconfig'.sourcekit.setup{}
-- Python
require'lspconfig'.pyright.setup{}
-- TS JS 
require'lspconfig'.tsserver.setup{}
-- Bash
require'lspconfig'.bashls.setup{}
-- JSON
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}
-- CSS
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- HTML
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

-- ANGULAR NO ME FUNCIONA
-- require'lspconfig'.angularls.setup{}

-- TREESITTER

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
}

-------------- FORMAT
-- I will use this until formatting from LSP is stable.

local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--stdin-filepath",
      vim.api.nvim_buf_get_name(0),
    },
    stdin = true,
  }
end

local rustfmt = function()
  return {
    exe = "rustfmt",
    args = {
      "--emit=stdout",
    },
    stdin = true,
  }
end

local stylua = function()
  return {
    exe = "stylua",
    args = { "--search-parent-directories", "-" },
    stdin = true,
  }
end

require("formatter").setup {
  logging = false,
  filetype = {
    javascript = {
      prettier,
    },
    javascriptreact = {
      prettier,
    },
    typescript = {
      prettier,
    },
    typescriptreact = {
      prettier,
    },
    css = {
      prettier,
    },
    less = {
      prettier,
    },
    sass = {
      prettier,
    },
    scss = {
      prettier,
    },
    json = {
      prettier,
    },
    graphql = {
      prettier,
    },
    markdown = {
      prettier,
    },
    vue = {
      prettier,
    },
    yaml = {
      prettier,
    },
    html = {
      prettier,
    },
    json = {
      prettier,
    },
    rust = {
      rustfmt,
    },
    lua = {
      stylua,
    },
  },
}

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.json,*.rs,*.lua FormatWrite
augroup END
]],
  true
)

EOF
