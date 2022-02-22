local M = {}

function M.keymap(mode, key, result, options)
  options = options or { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, key, result, options)
end

function M.buf_keymap(buff, mode, key, result, options)
  options = options or { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(buff, mode, key, result, options)
end

_G.utils = M
return M
