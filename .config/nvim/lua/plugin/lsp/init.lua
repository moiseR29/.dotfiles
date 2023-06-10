local present, _ = pcall(require, "lspconfig")

if not present then
  return
end

require("plugin.lsp.lsp-installer")
require("plugin.lsp.handlers").setup()
require("plugin.lsp.cmp")
require("plugin.lsp.luasniplsp")
require("plugin.lsp.autopairs")
require("plugin.lsp.nullls")
