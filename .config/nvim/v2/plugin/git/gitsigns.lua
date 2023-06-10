local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

local u = require "utils"

require("base46").load_highlight "git"

local options = {
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  },
  current_line_blame = true,
}

u.keymap("n", "<leader>gsp", "<cmd> Gitsigns preview_hunk <CR>")
u.keymap("n", "<leader>gsr", "<cmd> Gitsigns reset_hunk<CR>")
u.keymap("n", "<leader>gsu", "<cmd> Gitsigns undo_stage_hunk <CR>")
u.keymap("n", "<leader>gsf", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
u.keymap("n", "<leader>gsft", "<cmd>Gitsigns diffthis<CR>")

gitsigns.setup(options)
