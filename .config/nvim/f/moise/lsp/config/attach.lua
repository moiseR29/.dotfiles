local u = require "utils"

local M = {}

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
M.on_attach = function(_, bufnr)
  --client.resolved_capabilities.document_formatting = false
  --client.resolved_capabilities.document_range_formatting = false
--
  --if client.name == "jsonls" then
  --  client.resolved_capabilities.document_formatting = true
  --  client.resolved_capabilities.document_range_formatting = true
  --end

  lsp_keymaps(bufnr)
  --lsp_highlight_document(client)
end

return M