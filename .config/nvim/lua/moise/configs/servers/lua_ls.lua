local lsp_shared = require("moise.configs.lsp_shared")

return function(ops)
  return vim.tbl_extend("force", {
      on_attach = lsp_shared.on_attach,
      capabilities = lsp_shared.capabilities,
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
    }, ops)
end

