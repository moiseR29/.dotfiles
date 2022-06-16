require('lspconfig').terraformls.setup({
	on_attach = require("plugin.lsp.handlers").on_attach,
	capabilities = require("plugin.lsp.handlers").capabilities,
  filetypes = {'terraform', 'tf'},
  cmd = {'/home/mrebatta/.config/Code/User/globalStorage/hashicorp.terraform/bin/terraform-ls', 'serve'}
})
