local opts = { noremap = true, silent = false }

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", ":q<cr>", opts)

vim.api.nvim_set_keymap("n", "<leader>k", ":nohlsearch<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader><leader>", "<c-^>", opts)
vim.api.nvim_set_keymap("n", "<leader>e", "VG<cr>", opts)

vim.api.nvim_set_keymap("n", "n", "nzzzv", opts)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts)
vim.api.nvim_set_keymap("n", "<c-u>", "<c-u>zz", opts)
vim.api.nvim_set_keymap("n", "<c-d>", "<c-d>zz", opts)

vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope git_branches<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>Telescope media_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fo", "<cmd>Telescope colorscheme<cr>", opts)

vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>NvimTreeFindFileToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>p", ":lua require'options'.toggleProse()<cr>", opts)

-- TODO: crear un atajo para sourcear toda la config
