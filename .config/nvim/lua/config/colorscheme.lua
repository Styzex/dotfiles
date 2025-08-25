return {
  { "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000, 
  },
  { "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
    end
  },
  { "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "Styzex/Sonomin.nvim",
    lazy = false,
    priority = 1000
  },
  {
    "Yazeed1s/minimal.nvim",
    lazy = false,
    priority = 1000
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "warmer"
      })
    end
  },
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        colors = {
          bg = "#0c0c0d"
        }
      })
    end
  },
}