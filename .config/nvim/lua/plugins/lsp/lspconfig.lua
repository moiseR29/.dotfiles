return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = require("moise.configs.lspconfig").config,
  opts = {
    mason = {
      enable = true,
      auto_install = false
    }
  }
}
