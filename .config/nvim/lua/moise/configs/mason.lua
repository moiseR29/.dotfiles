local lsp_shared = require("moise.configs.lsp_shared")

local h = {}

h.config = function ()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local mason_tool_installer = require("mason-tool-installer")

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
    -- list of servers for mason to install
    ensure_installed = lsp_shared.servers,
    automatic_installation = true,
  })

  mason_tool_installer.setup({
    ensure_installed = lsp_shared.lintersAndFormatter
  })
end

return h