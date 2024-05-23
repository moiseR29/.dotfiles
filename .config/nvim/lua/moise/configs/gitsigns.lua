local u = require("utils")

local h = {}

h.on_attach = function (bufnr)
  local gitsigns = require "gitsigns"
  vim.keymap.set("n", "<leader>gsp", gitsigns.preview_hunk, { buffer = bufnr })
  vim.keymap.set("n", "<leader>gsr", gitsigns.reset_hunk, { buffer = bufnr })
  vim.keymap.set("n", "<leader>gsu", gitsigns.undo_stage_hunk, { buffer = bufnr })
  u.keymap("n", "<leader>gsf", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
  u.keymap("n", "<leader>gsft", "<cmd>Gitsigns diffthis<CR>")
end

h.max_file_lines = 10000

return h