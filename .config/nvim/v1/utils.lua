local M = {}

function M.keymap(mode, key, result, options)
  options = options or { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, key, result, options)
end

function M.buf_keymap(buff, mode, key, result, options)
  options = options or { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(buff, mode, key, result, options)
end

function M.global(key, value)
  vim.g[key] = value
end

function M.merge(t1, t2)
	return vim.tbl_deep_extend("force", t2, t1)
end

_G.utils = M
return M
