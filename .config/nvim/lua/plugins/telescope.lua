return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("telescope").setup({
            extensions = {
                undo = {},
                file_browser = {
                  initial_mode = "normal",
                  hijack_netrw = true,
                },
            },
        })
        require("telescope").load_extension("undo")
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("harpoon")
    end,
}
