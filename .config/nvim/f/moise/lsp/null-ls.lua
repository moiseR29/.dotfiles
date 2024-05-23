local present, nls = pcall(require, "null-ls")

if not present then
  return
end

local h = require("moise.plugins.lsp.config.capabilities")

local nls_utils = require("null-ls.utils")

local formatting = nls.builtins.formatting
local diagnostics = nls.builtins.diagnostics
local actions = nls.builtins.code_actions

local sources = {
  -- JS | TS
  -- Formatter
  formatting.prettier.with {
    prefer_local = "./node_modules/.bin",
    filetypes = { "javascript", "typescript" }, -- 'yaml', 'markdown'environment bash
  },

  -- diagnostics
  diagnostics.eslint.with {
    prefer_local = "./node_modules/.bin",
    filetypes = { "javascript", "typescript", "json" }, -- 'yaml', 'markdown'
  },

  -- Actions
  actions.eslint.with {
    prefer_local = "./node_modules/.bin",
    filetypes = { "javascript", "typescript", "json" }, -- 'yaml', 'markdown'
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

nls.setup({
  sources = sources,
  capabilities = h.capabilities,
  on_attach = function (client)
    vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, {desc = "LSP (null ls) Code actions"})
    vim.keymap.set("n", "<leader>vf", function()
      return vim.lsp.buf.format { async = true }
    end, {desc = "LSP (null ls) Format file"})
  end,
  root_dir = nls_utils.root_pattern(".git", ".null-ls-root"),
})


