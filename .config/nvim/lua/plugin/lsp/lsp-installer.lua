local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("plugin.lsp.handlers").on_attach,
		capabilities = require("plugin.lsp.handlers").capabilities,
	}

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("plugin.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("plugin.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 if server.name == "dockerls" then
	 	local dockerls_opts = require("plugin.lsp.settings.dockerls")
	 	opts = vim.tbl_deep_extend("force", dockerls_opts, opts)
	 end

	 if server.name == "tflint" then
	 	local tflint_opts = require("plugin.lsp.settings.tflint")
	 	opts = vim.tbl_deep_extend("force", tflint_opts, opts)
	 end

	 if server.name == "bashls" then
	 	local bashls_opts = require("plugin.lsp.settings.bashls")
	 	opts = vim.tbl_deep_extend("force", bashls_opts, opts)
	 end

	 if server.name == "sqlls" then
	 	local sqlls_opts = require("plugin.lsp.settings.sqlls")
	 	opts = vim.tbl_deep_extend("force", sqlls_opts, opts)
	 end

	 if server.name == "grammarly" then
	 	local grammarly_opts = require("plugin.lsp.settings.grammarly")
	 	opts = vim.tbl_deep_extend("force", grammarly_opts, opts)
	 end

	 if server.name == "yamlls" then
	 	local yamlls_opts = require("plugin.lsp.settings.yamlls")
	 	opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
	 end

	server:setup(opts)

  -- CHARGE THE MANUAL PLUGINS
  require("plugin.lsp.settings.terraformls")
  require("plugin.lsp.settings.nullls").setup(opts)
end)
