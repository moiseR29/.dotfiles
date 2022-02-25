local u = require('utils')

u.keymap("n", "<leader>ff", ":Telescope find_files<CR>")
u.keymap("n", "<leader>fg", ":Telescope live_grep<CR>")
u.keymap("n", "<leader>fgb", ":Telescope git_branches<CR>")
u.keymap("n", "<leader>fgs", ":Telescope git_status<CR>")
u.keymap("n", "<leader>fb", ":Telescope buffers<CR>")
u.keymap("n", "<leader>fgc", ":Telescope git_commits<CR>")

require('telescope').setup({
  defaults = {
    prompt_prefix = " ",
  },
  file_ignore_patterns = { "node_modules", ".terraform" }
})
