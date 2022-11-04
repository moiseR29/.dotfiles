local present, terminal = pcall(require, "toggleterm")

if not present then
  return
end

local u = require "utils"

u.keymap("t", "<esc>", "<C-\\><C-n>")
u.keymap("n", "<leader>tt", ":2ToggleTerm<CR>")

terminal.setup {
  open_mapping = [[<c-t>]],
}
