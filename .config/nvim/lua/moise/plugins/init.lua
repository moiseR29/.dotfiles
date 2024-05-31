return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  "christoomey/vim-tmux-navigator", -- tmux & split window navigation

  "mg979/vim-visual-multi", -- multi selector,

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons"
    },
    config = function ()
      local u = require("utils")
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
        },
        pickers = {
          git_files = {
            show_untracked = true
          }
        },
        extensions = {
          fzy_native = {
            override_generic_sorter = true,
            override_file_sort = true
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              borderchars = {
                prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
                preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
              },
              width = 0.8,
              previewer = false,
            }
          }
        }
      })

      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      telescope.load_extension("ui-select")

      u.keymap("n", "<leader>tff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      --u.keymap("n", "<leader>tfg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })

      u.keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      u.keymap("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
      u.keymap("n", "<leader>tfc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

      u.keymap("n", "<leader>tgb", "<cmd>Telescope git_branches<cr>", { desc = "Show git branches" })
      u.keymap("n", "<leader>tgf", "<cmd>Telescope git_files<cr>", { desc = "Show git Files" })
      u.keymap("n", "<leader>tgs", "<cmd>Telescope git_status<cr>", { desc = "Show git status" })
      u.keymap("n", "<leader>tgc", "<cmd>Telescope git_commits<cr>", { desc = "Show git commits" })
      u.keymap("n", "<leader>tgcb", "<cmd>Telescope git_bcommits<cr>", { desc = "Show git buffer commits" })
      u.keymap("n", "<leader>tb", "<cmd>Telescope buffers<cr>", { desc = "Show buffers" })
      u.keymap("n", "<leader>tm", "<cmd>Telescope file_browser<cr>", { desc = "Show file browser", noremap = true })
    end
  }
}

