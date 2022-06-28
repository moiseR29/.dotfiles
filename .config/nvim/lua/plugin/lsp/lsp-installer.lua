local present, lsp_installer = pcall(require, "nvim-lsp-installer")

if not present then
  return
end

local u = require "utils"

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("plugin.lsp.handlers").on_attach,
    capabilities = require("plugin.lsp.handlers").capabilities,
  }

  if server.name == "tsserver" then
    local tsserver_opts = require "plugin.lsp.settings.tsserver"
    opts = u.merge(tsserver_opts, opts)
  end

  if server.name == "jsonls" then
    local jsonls_opts = require "plugin.lsp.settings.jsonls"
    opts = u.merge(jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require "plugin.lsp.settings.sumneko_lua"
    opts = u.merge(sumneko_opts, opts)
  end

  if server.name == "dockerls" then
    local dockerls_opts = require "plugin.lsp.settings.dockerls"
    opts = u.merge(dockerls_opts, opts)
  end

  if server.name == "tflint" then
    local tflint_opts = require "plugin.lsp.settings.tflint"
    opts = u.merge(tflint_opts, opts)
  end

  if server.name == "terraformls" then
    local terraformls_opts = require "plugin.lsp.settings.terraformls"
    opts = u.merge(terraformls_opts, opts)
  end

  if server.name == "bashls" then
    local bashls_opts = require "plugin.lsp.settings.bashls"
    opts = u.merge(bashls_opts, opts)
  end

  if server.name == "sqlls" then
    local sqlls_opts = require "plugin.lsp.settings.sqlls"
    opts = u.merge(sqlls_opts, opts)
  end

  if server.name == "yamlls" then
    local yamlls_opts = require "plugin.lsp.settings.yamlls"
    opts = u.merge(yamlls_opts, opts)
  end

  if server.name == "gopls" then
    local gopls_opts = require "plugin.lsp.settings.gopls"
    opts = u.merge(gopls_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require "plugin.lsp.settings.pyright"
    opts = u.merge(pyright_opts, opts)
  end

  server:setup(opts)
end)
