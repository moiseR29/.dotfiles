return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require "mason"

    local mason_lspconfig = require "mason-lspconfig"

    local mason_tool_installer = require "mason-tool-installer"

    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }

    mason_lspconfig.setup {
      ensure_installed = {
        "tsserver",
        "lua_ls",
        "terraformls",
        "dockerls",
        "gopls",
        "jsonls",
        "yamlls",
        "docker_compose_language_service",
      },
    }

    mason_tool_installer.setup {
      -- [[
      -- TODO:
      --# Formatters
      --    - prettier ( JS )
      --    - stylua ( lua )
      --    - black ( python )
      --# Linter
      --    - pylint ( python )
      --    - eslint ( JS )
      --    - golangci-lint ( GO )
      --]]
      ensure_installed = {
        "prettier",
        "stylua",
        "black",
        "pylint",
        "eslint",
        "golangci-lint",
      },
    }
  end,
}
