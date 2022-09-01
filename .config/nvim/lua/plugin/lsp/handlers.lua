local present, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local u = require "utils"

local M = {}

-- LSP CONFIG
-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- virtual_text = {
    --   prefix = "",
    -- },
    signs = true,
    underline = true,
    update_in_insert = false,
    virtual_text = false,
    --signs = {
    --  active = signs,
    --},
    --update_in_insert = true,
    --underline = true,
    --severity_sort = true,
    --float = {
    --  focusable = false,
    --  style = "minimal",
    --  border = "rounded",
    --  source = "always",
    --  header = "",
    --  prefix = "",
    --},
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
  })

  -- suppress error messages from lang servers
  vim.notify = function(msg, log_level)
    if msg:match "exit code" then
      return
    end
    if log_level == vim.log.levels.ERROR then
      vim.api.nvim_err_writeln(msg)
    else
      vim.api.nvim_echo({ { msg } }, true, {})
    end
  end

  -- Borders for LspInfo winodw
  local win = require "lspconfig.ui.windows"
  local _default_opts = win.default_opts

  win.default_opts = function(options)
    local opts = _default_opts(options)
    opts.border = "single"
    return opts
  end

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
    silent = true,
    focusable = false,
    close_events = { "InsertCharPre", "CursorMoved" },
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  -- autocmd CursorHold <buffer> lua vim.diagnostic.open_float(nil, {focus=false}) This line show diagnostics
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorHold <buffer> lua vim.diagnostic.open_float(nil, {focus=false})
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
    vim.o.updatetime = 500
  end
end

-- LSP MAPPERS
local function lsp_keymaps(bufnr)
  u.keymap("n", "<leader>gD", ":lua vim.lsp.buf.declaration()<cr>")
  u.keymap("n", "<leader>gd", ":lua vim.lsp.buf.definition()<cr>")
  u.keymap("n", "K", ":lua vim.lsp.buf.hover()<cr>")
  u.keymap("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<cr>")

  u.keymap("n", "<leader>vn", ':lua vim.lsp.diagnostic.goto_next({ border = "rounded" })<cr>')
  u.keymap("n", "<leader>vp", ':lua vim.lsp.diagnostic.goto_prev({ border = "rounded" })<cr>')
  u.keymap("n", "<leader>vca", ":lua vim.lsp.buf.code_action()<cr>")
  u.keymap("n", "<leader>vf", ":lua vim.lsp.buf.formatting()<cr>")

  u.buf_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  u.buf_keymap(bufnr, "n", "<leader>vsd", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>")
  --u.buf_keymap(bufnr, "n", "<leader>vsd", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>")
end

-- LSP ON ATTACH
M.on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  if client.name == "jsonls" then
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.document_range_formatting = true
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
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

M.capabilities = capabilities

return M
