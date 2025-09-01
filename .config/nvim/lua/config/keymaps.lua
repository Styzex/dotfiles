local keymap = vim.keymap.set
local telescope = require("telescope")
local harpoon_mark = require("harpoon.mark")
table.unpack = table.unpack

-- Shortcuts
keymap('n', '<leader>q', ':qa')
keymap('n', '<leader>w', ':wa')
keymap('n', '<leader>e', ':wqa')
keymap('n', '<leader>r', ':qa!')

-- Telescope
keymap('n', '<S-p>', ":Telescope find_files<cr>")
keymap('n', '<leader>fg', ":Telescope git_files<cr>")
keymap('n', '<leader>fb', ":Telescope live_grep<cr>")
keymap("n", "<leader>u", "<cmd>Telescope undo<cr>")

-- Telescope File browser
keymap("n", "<S-j>", ":Telescope file_browser<CR>")

-- Themery 
keymap("n", "<leader>t", ":Themery<CR>", { desc = "Open Themery Theme Picker" })

-- Harpoon
keymap("n", "<leader>h", function()
  telescope.extensions.harpoon.marks()
end)

vim.keymap.set("n", "<leader>m", function()
  harpoon_mark.add_file()
end)
