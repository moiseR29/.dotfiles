local g_configs = require("moise.configs.gitsigns")

return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    signs = {
      add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
      change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
      delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
      changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
    },
    current_line_blame = true,
    on_attach = g_configs.on_attach,
    max_file_length = g_configs.max_file_lines,
  },
}