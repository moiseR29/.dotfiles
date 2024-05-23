return {
  setup = function(ops)
    ops = vim.tbl_deep_extend("force", require "moise.plugins.lsp.config.ops", ops)

    local lspconfig = require("lspconfig")

    local mason_servers = {}

    for server, options in pairs(ops.servers) do
      if options.enable == true then
        local ok, definition = pcall(require, "moise.plugins.lsp.servers." .. server)
        local server_options
        if not ok then
          server_options = ops.default_options(options)
        else
          server_options = definition(options)
        end
        lspconfig[server].setup(server_options)
        table.insert(mason_servers, server)
      end
    end

    if ops.mason.enable then
      local mason_ops = {}
      if ops.mason.auto_install == true then
        mason_ops.ensure_installed = mason_servers
      end
      local mason_lspconfig = require "mason-lspconfig"
      mason_lspconfig.setup(mason_ops)
    end

    --require "moise.plugins.lsp.servers.null-ls"

    local servers = {}
    for server, options in pairs(ops.servers) do
      table.insert(servers, string.format("%s <%s>", server, options.enable))
    end
  end
}