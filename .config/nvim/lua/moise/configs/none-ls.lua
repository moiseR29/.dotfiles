local lsp_shared = require("moise.configs.lsp_shared")

local h = {}

h.config = function()
  local mason_null_ls = require("mason-null-ls")

  local null_ls = require("null-ls")

  local null_ls_utils = require("null-ls.utils")

    mason_null_ls.setup({
      ensure_installed = lsp_shared.none
    })

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local actions = null_ls.builtins.code_actions

    -- to setup format on save
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local sources = {
      formatting.prettier.with {
        prefer_local = "./node_modules/.bin",
        filetypes = {"javascript","typescript"}
      },

      diagnostics.eslint.with({
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.js", ".eslintrc" })
        end,
        prefer_local = "./node_modules/.bin",
      }),

      -- Actions
      actions.eslint.with {
        prefer_local = "./node_modules/.bin",
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.js", ".eslintrc" })
        end,
        filetypes = { "javascript", "typescript", "json" }, -- 'yaml', 'markdown'
      },

      formatting.stylua, -- lua formatter

      formatting.black.with {
        condition = function(utils)
          return utils.root_has_file { "pyproject.toml" }
        end,
      },

      diagnostics.pylint,
    }
    
    -- configure null_ls
    null_ls.setup({
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      -- setup formatters & linters
      sources = sources,
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    })
end

return h