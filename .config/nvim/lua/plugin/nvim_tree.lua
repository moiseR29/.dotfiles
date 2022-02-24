local u = require("utils")

u.global("nvim_tree_indent_markers",1)

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "M",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    -- arrow_open = " ",
    -- arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  ignore_ft_on_setup = {'dashboard'},
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
  system_open = {
    cmd = nil,
    args = {}
  },
  view = {
    side = 'left',
    auto_resize = true,
    mappings = {custom_only = false, list = {}},
    number = true,
    relativenumber = true
  },
  update_to_buf_dir = {
    enable = true,
    auto_open = true
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  }
})

u.keymap("n", "<leader>m", ":NvimTreeToggle<CR>")
