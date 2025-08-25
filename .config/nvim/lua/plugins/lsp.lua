return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "lua_ls", "gopls"}, -- Add desired LSP servers here
      automatic_installation = true, -- Auto-install servers when needed
    },
  },
}
