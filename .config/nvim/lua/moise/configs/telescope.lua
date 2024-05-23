local u = require("utils")

local h = {}

h.config = function ()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      path_displat = {"truncate "},
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous, -- move to prev result
          ["<C-j>"] = actions.move_selection_next, -- move to next result
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        }
      },
      file_ignore_patterns = { "node_modules", ".terraform", ".venv" },
    }
  })

  telescope.load_extension("fzf")
  telescope.load_extension("file_browser")

  u.keymap("n", "<leader>tff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
  u.keymap("n", "<leader>tfg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
  u.keymap("n", "<leader>tfc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

  u.keymap("n", "<leader>tgb", "<cmd>Telescope git_branches<cr>", { desc = "Show git branches" })
  u.keymap("n", "<leader>tgf", "<cmd>Telescope git_files({show_untracked = true})<cr>", { desc = "Show git Files" })
  u.keymap("n", "<leader>tgs", "<cmd>Telescope git_status<cr>", { desc = "Show git status" })
  u.keymap("n", "<leader>tgc", "<cmd>Telescope git_commits<cr>", { desc = "Show git commits" })
  u.keymap("n", "<leader>tbgc", "<cmd>Telescope git_bcommits<cr>", { desc = "Show git buffer commits" })
  u.keymap("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { desc = "Show buffers" })
  u.keymap("n", "<leader>tm", "<cmd>Telescope file_browser<cr>", { desc = "Show file browser", noremap = true })
end

return h