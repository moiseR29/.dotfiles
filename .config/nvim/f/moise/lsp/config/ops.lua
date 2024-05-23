return {
  mason = {
    enable = true,
    auto_install = false
  },
  mason_servers = {
    "lua_ls",
  },
  servers = {
    emmet_ls = { enable = true },
    gopls = { enable = true },
    jsonls = { enable = true },
    lua_ls = { enable = true, neodev = true },
    tsserver = { enableserver = true },
  },
  default_options = function (options)
    return vim.tbl_deep_extend("force", {
      on_attach = require"moise.plugins.lsp.config.attach".on_attach,
    }, options)
  end,
}