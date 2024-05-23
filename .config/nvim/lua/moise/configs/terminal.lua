
local h = {}

h.config = function ()
  local terminal = require "toggleterm"
  local u = require "utils"
  
  u.keymap("t", "<esc>", "<C-\\><C-n>")
  u.keymap("n", "<leader>tt", ":2ToggleTerm<CR>")
  
  terminal.setup {
    open_mapping = [[<c-t>]],
  }
end

return h

