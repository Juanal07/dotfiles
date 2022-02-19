local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "<leader>w", ":w<cr>", opts)
keymap("n", "<leader>q", ":q<cr>", opts)
keymap("n", "<leader>k", ":nohlsearch<cr>", opts)
keymap("n", "<leader><leader>", "<c-^>", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<c-u>", "<c-u>zz", opts)
keymap("n", "<c-d>", "<c-d>zz", opts)
keymap("n", "<leader>e", "VG<cr>", opts)
-- Better window navigation
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("v", "p", '"_dP', opts) -- al pegar un texto sobre un texto en visual mode no copia lo que habia si no lo que he pegado

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope git_branches<cr>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", opts)
keymap("n", "<leader>fm", "<cmd>Telescope media_files<cr>", opts)
keymap("n", "<leader>fm", "<cmd>Telescope media_files<cr>", opts)
keymap("n", "<leader>fo", "<cmd>Telescope colorscheme<cr>", opts)
keymap("n", "<leader>p", "<cmd>MarkdownPreviewToggle<cr>", opts)
keymap("n", "<leader>n", "<cmd>NvimTreeFindFileToggle<CR>", opts)
keymap("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", opts)

-- vim.cmd("nnoremap <leader>n :NvimTreeToggle<CR>")
-- vim.cmd("nnoremap <leader>r :NvimTreeRefresh<CR>")
-- vim.cmd("nnoremap <leader>n :NvimTreeFindFile<CR>")

-- TODO: crear un atajo para sourcear toda la config
-- nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
