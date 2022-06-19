local present, nls = pcall(require, "null-ls")

if not present then
  return
end

local h = require("plugin.lsp.handlers")

local nls_utils = require "null-ls.utils"

local formatting = nls.builtins.formatting
local diagnostics = nls.builtins.diagnostics
local actions = nls.builtins.code_actions

--formatting.autopep8,

local sources = {
  -- Formatter
  formatting.prettier.with({
    prefer_local = "./node_modules/.bin",
    filetypes = {'javascript', 'typescript', 'yaml', 'markdown'},
  }),
  -- formatting.stylua, --Need stylelua

  -- diagnostics
  diagnostics.eslint.with({
    prefer_local = "./node_modules/.bin",
    filetypes = {'javascript', 'typescript', 'yaml', 'markdown'},
  }),

  -- Actions
  actions.eslint.with({
    prefer_local = "./node_modules/.bin",
    filetypes = {'javascript', 'typescript', 'yaml', 'markdown'},
  }),
  actions.gitsigns,

  --formatting.gofmt,
  --diagnostics.gofmt
}

nls.setup {
  --filetypes = {'javascript', 'typescript', 'yaml', 'markdown'},
   -- debug = true,
  sources = sources,
  capabilities = h.capabilities,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
        augroup lspformatting
          autocmd! * <buffer>
          autocmd bufwritepre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup end
      ]])
    end
  end,
  root_dir = nls_utils.root_pattern ".git",
}
