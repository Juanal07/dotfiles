local opts = { noremap = true, silent = false }

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>q", ":q<cr>", opts)

vim.api.nvim_set_keymap("n", "<leader>k", ":nohlsearch<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader><space>", "<c-^>", opts)
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

vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>*", ":Telescope grep_string<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fc", ":Telescope git_commits<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fu", ":Telescope git_bcommits<cr>", opts)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	[[<cmd>lua require('telescope.builtin').buffers({ sort_lastused = true })<CR>]],
	opts
)
vim.api.nvim_set_keymap("n", "<leader>fm", ":Telescope media_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fo", ":Telescope colorscheme<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fs", ":Telescope git_status<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fd", ":Telescope diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fp", ":Telescope neoclip<cr>", opts)

vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFileToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>p", ":MarkdownPreviewToggle<cr>", opts)

-- vim.api.nvim_set_keymap("n", "<leader>p", ":lua require'options'.toggleProse()<cr>", opts)

vim.api.nvim_set_keymap("n", "<leader>dvo", ":DiffviewOpen<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dvc", ":DiffviewClose<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dvh", ":DiffviewFileHistory %<cr>", opts)

vim.api.nvim_set_keymap("n", "<Leader>mr", ':lua require("neotest").run.run()<CR>', opts)
vim.api.nvim_set_keymap("n", "<Leader>ms", ':lua require("neotest").run.stop()<CR>', opts)
vim.api.nvim_set_keymap("n", "<Leader>mo", ':lua require("neotest").output.open()<CR>', opts)
vim.api.nvim_set_keymap("n", "<Leader>mO", ':lua require("neotest").output.open({enter = true})<CR>', opts)
vim.api.nvim_set_keymap("n", "<Leader>mi", ':lua require("neotest").summary.toggle()<CR>', opts)
vim.api.nvim_set_keymap("n", "<Leader>mf", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)

vim.api.nvim_set_keymap("n", "<leader>dd", ":lua require('dapui').toggle()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dc", ":lua require('dap').continue()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>do", ":lua require('dap').step_over()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>di", ":lua require('dap').step_into()<cr>", opts)

-- changed_on_branch = function()
-- 	local previewers = require("telescope.previewers")
-- 	local pickers = require("telescope.pickers")
-- 	local sorters = require("telescope.sorters")
-- 	local finders = require("telescope.finders")
-- 	pickers
-- 		.new({
-- 			results_title = "Modified on current branch",
-- 			finder = finders.new_oneshot_job({
-- 				"/home/juan/.local/bin/git/git-branch-modified",
-- 				"list",
-- 			}),
-- 			sorter = sorters.get_fuzzy_file(),
-- 			previewer = previewers.new_termopen_previewer({
-- 				get_command = function(entry)
-- 					return {
-- 				"/home/juan/.local/bin/git/git-branch-modified",
-- 						"diff",
-- 						entry.value,
-- 					}
-- 				end,
-- 			}),
-- 		})
-- 		:find()
-- end
-- vim.api.nvim_set_keymap("n", "<leader>fa", ":lua changed_on_branch()<cr>", opts)
