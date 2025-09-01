return {
  { "vague2k/vague.nvim", name = "vague", lazy = false },
  { "slugbyte/lackluster.nvim", name = "lackluster", lazy = false },
  { "morhetz/gruvbox", name = "gruvbox", lazy = false },
  { "rose-pine/neovim", name = "rose-pine", lazy = false },
  { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon", lazy = false },
  { "yorumicolors/yorumi.nvim", name = "yorumi", lazy = false },
  { "cdmill/neomodern.nvim", name = "roseprime", lazy = false, config = function() require("neomodern").setup({ theme = "roseprime", variant = "dark" }) end, },

  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      vim.g.gruvbox_contrast_dark = "hard"

      require("themery").setup({
        themes = {"gruvbox", "lackluster", "vague", "roseprime", "rose-pine", "oxocarbon", "yorumi"},
        livePreview = true,
        save = true,
      })
    end
  },
}
