local u = require("utils")

local nls = require("null-ls")
local nls_utils = require "null-ls.utils"

local formatting = nls.builtins.formatting
local diagnostics = nls.builtins.diagnostics
local actions = nls.builtins.code_actions

local M = {}

local sources = {}


--formatting.autopep8,
--formatting.stylua,

local JsTsSources = {
    formatting.prettier.with({
        prefer_local = "./node_modules/.bin"
    }),
    diagnostics.eslint.with({
        prefer_local = "./node_modules/.bin"
    }),
    actions.eslint,
}

sources = u.merge(JsTsSources, sources)

function M.setup(opts)
  nls.setup {
    -- debug = true,
    sources = sources,
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
end

return M
