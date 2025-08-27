local keymap = vim.keymap.set
table.unpack = table.unpack or unpack

-- Shortcuts
keymap('n', '<leader>q', ':qa')
keymap('n', '<leader>w', ':wa')
keymap('n', '<leader>e', ':wqa')
keymap('n', '<leader>r', ':qa!')

-- Telescope
keymap('n', '<C-p>', ":Telescope find_files<cr>")
keymap('n', '<leader>fg', ":Telescope git_files<cr>")
keymap('n', '<leader>fb', ":Telescope live_grep<cr>")
keymap("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- Oil
keymap("n", "<S-j>", ":Oil<cr>", { desc = "Open parent directory" })

-- Themery 
keymap("n", "<leader>t", ":Themery<CR>", { desc = "Open Themery Theme Picker" })

