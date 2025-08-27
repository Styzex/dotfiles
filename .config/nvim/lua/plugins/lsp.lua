return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },
    opts = {
      ensure_installed = { "lua_ls", "gopls"},
      automatic_installation = true,
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      local blink_cmp = require('blink.cmp')

      local capabilities = blink_cmp.get_lsp_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }

      for _, server in ipairs(opts.ensure_installed) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      vim.diagnostic.config({
        virtual_text = {
          prefix = '■',
          spacing = 2,
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end
  },
}
