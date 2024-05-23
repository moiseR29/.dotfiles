local u = require "utils"
local present, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

local h = {}

h.servers = {
  "emmet_ls",
  "lua_ls",
  "dockerls",
  "jsonls",
  "pyright",
  "tsserver",
}

h.lintersAndFormatter = {
  "prettier",
  "stylua",
  --"eslint_d",
  "eslint",
  "black",
  "pylint"
}

h.none = {
  "prettier",
  "stylua",
  --"eslint_d",
  "eslint",
  "black",
  "pylint"
}

h.mason = {
  enable = true,
  auto_install = false
}

h.lsp_servers = {
  tsserver = { enable = true },
  lua_ls = { enable = true, neodev = true },
  emmet_ls = { enable = true },
  dockerls = { enable = true },
  jsonls = { enable = true },
  pyright = { enable = true },
}

h.default_options = function (options)
  return vim.tbl_deep_extend("force", {
    on_attach = h.on_attach,
  }, options)
end

h.on_attach = function (client, bufnr)
  local keymap = vim.keymap
  local opts = { noremap = true, silent = true, buffer = bufnr }

  opts.desc = "Go to declaration"
  keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

  opts.desc = "Go to definition"
  keymap.set("n", "<leader>gd", ":lua vim.lsp.buf.definition()<cr>", opts)
  opts.desc = "Go to definition with Telescope"
  keymap.set("n", "<leader>tgd", "<cmd>Telescope lsp_definitions<CR>", opts)

  opts.desc = "Show LSP implementations"
  keymap.set("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<cr>", opts)
  opts.desc = "Show LSP implementations with Telescope"
  keymap.set("n", "<leader>tgi", "<cmd>Telescope lsp_implementations<CR>", opts)
  
  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts)

  opts.desc = "See available code actions"
  keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)

  opts.desc = "Smart rename"
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

  keymap.set("n", "<leader>vn", ':lua vim.lsp.diagnostic.goto_next({ border = "rounded" })<cr>')
  keymap.set("n", "<leader>vp", ':lua vim.lsp.diagnostic.goto_prev({ border = "rounded" })<cr>')
  keymap.set("n", "<leader>vf", ":lua vim.lsp.buf.format()<cr>")

  u.buf_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  u.buf_keymap(bufnr, "n", "<leader>vsd", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>")
  opts.desc = "Show buffer diagnostics"
  keymap.set(bufnr, "n", "<leader>tsd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
  --u.buf_keymap(bufnr, "n", "<leader>vsd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>")

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end


-- LSP CAPABILITIES
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

if present then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

h.capabilities = capabilities


return h