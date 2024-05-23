local present, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

local M = {}

-- LSP CAPABILITIES
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

if present then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

M.capabilities = capabilities

return M