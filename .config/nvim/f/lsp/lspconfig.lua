return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded"
        }
      }
    },
    "folke/neodev.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  main = "moise.plugins.lsp",
  event = "VeryLazy",
  --opts = {
  --  mason = {
  --    enable = true,
  --    auto_install = false
  --  }
  --}
}