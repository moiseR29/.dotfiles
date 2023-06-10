require('lspconfig').terraform_lsp.setup({
	on_attach = require("plugin.lsp.handlers").on_attach,
	capabilities = require("plugin.lsp.handlers").capabilities,
  filetypes = {'terraform', 'tf'},
  cmd = {'terraform-lsp'}
})
