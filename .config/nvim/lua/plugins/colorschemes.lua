return {
  { "vague2k/vague.nvim", name = "vague", lazy = false },
  { "slugbyte/lackluster.nvim", name = "lackluster", lazy = false },
  { "morhetz/gruvbox", name = "gruvbox", lazy = false },
  { "rose-pine/neovim", name = "rose-pine", lazy = false},
  { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon", lazy = false },

  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      vim.g.gruvbox_contrast_dark = "hard"

      require("themery").setup({
        themes = {"gruvbox", "lackluster", "vague", "rose-pine", "oxocarbon"},
        livePreview = true,
        save = true,
      })
    end
  },
}
