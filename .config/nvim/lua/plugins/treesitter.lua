return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "go", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      auto_install = true,
    })

    require('nvim-treesitter.install').ensure_installed({ "go" })
  end
}

