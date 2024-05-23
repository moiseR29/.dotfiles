local lsp_shared = require("moise.configs.lsp_shared")


local h = {}

h.config = function()
  local lspconfig = require("lspconfig")
  
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local mason_tool_installer = require("mason-tool-installer")
  
  local nls = require("null-ls")
  local nls_utils = require "null-ls.utils"
  local formatting = nls.builtins.formatting
  local diagnostics = nls.builtins.diagnostics
  local actions = nls.builtins.code_actions

  local sources = {
    -- JS | TS
    -- Formatter
    formatting.prettier.with {
      prefer_local = "./node_modules/.bin",
      filetypes = { "javascript", "typescript" }, -- 'yaml', 'markdown'environment bash
      condition = function (utils)
        return nls_utils.root_has_file({ ".prettierrc" })
      end
    },

    -- diagnostics
    diagnostics.eslint.with {
      prefer_local = "./node_modules/.bin",
      filetypes = { "javascript", "typescript", "json" }, -- 'yaml', 'markdown'
      condition = function (utils)
        return nls_utils.root_has_file({ ".eslintrc" })
      end
    },

    -- Actions
    actions.eslint.with {
      prefer_local = "./node_modules/.bin",
      filetypes = { "javascript", "typescript", "json" }, -- 'yaml', 'markdown'
      condition = function (utils)
        return nls_utils.root_has_file({ ".eslintrc" })
      end
    },

    -- LUA
    --Formatter
    formatting.stylua, --Need stylelua

    -- Python
    -- Formatter
    formatting.black.with {
      condition = function(utils)
        return utils.root_has_file { "pyproject.toml" }
      end,
    },

    -- diagnostics
    diagnostics.flake8.with {
      condition = function(utils)
        return utils.root_has_file { ".flake8" }
      end,
    },

    -- GO
    -- diagnostics
    diagnostics.golangci_lint,

    -- Format
    formatting.gofmt,

    -- SHELL
    -- diagnostics
    diagnostics.shellcheck,

    -- Actions
    actions.shellcheck,

    -- Terraform
    formatting.terraform_fmt,

    -- Git
    -- Actions
    actions.gitsigns,
  }


  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  local mason_servers = {}

  mason_tool_installer.setup({
    ensure_installed = lsp_shared.lintersAndFormatter
  })

  for server, options in pairs(lsp_shared.lsp_servers) do
    if options.enable == true then
      local ok, definition = pcall(require, "moise.configs.servers." .. server)
      local server_options
      if not ok then
        server_options = lsp_shared.default_options(options)
      else
        server_options = definition(options)
      end
      lspconfig[server].setup(server_options)
      table.insert(mason_servers, server)
    end
  end


  mason_lspconfig.setup({
    -- list of servers for mason to install
    ensure_installed = mason_servers,
    automatic_installation = true,
  })

  nls.setup({
    sources = sources,
    root_dir = nls_utils.root_pattern(".git", ".null-ls-root"),
    on_attach = function()
      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function ()
          vim.lsp.buf.format({async=true})
        end
      })
    end,
  })

  vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, {desc = "LSP (null ls) Code actions"})
  vim.keymap.set("n", "<leader>vg", function()
    return vim.lsp.buf.format { async = true }
  end, {desc = "LSP (null ls) Format file"})
end

return h