local h = {}

h.config = function ()
  local present, nvimtree = pcall(require, "nvim-tree")
  local api = require('nvim-tree.api')

if not present then
  return
end

local u = require "utils"

local options = {
  filters = {
    dotfiles = false,
    exclude = { "custom" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  --open_on_tab = false,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    side = "left",
    width = 40,
    number = true,
    relativenumber = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",
    indent_markers = {
      enable = false,
    },
    icons = {
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "M",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "",
          -- unstaged = "✗",
          -- staged = "✓",
          -- unmerged = "",
          -- renamed = "➜",
          -- untracked = "★",
          -- deleted = "",
          -- ignored = "◌",
        },
      },
    },
  },
}

nvimtree.setup(options)

u.keymap("n", "<leader>m", ":NvimTreeToggle<CR>")
vim.keymap.set('n', '<C-t>',   api.node.open.tab)
vim.keymap.set('n', '<C-v>',   api.node.open.vertical)

end

return h