local h = {}

h.config = function ()
      -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local lspconfig = require("lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    local servers = require("moise.plugins.lsp.config.ops").mason_servers

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
      },
    })
end

return h