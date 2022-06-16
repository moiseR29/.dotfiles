local u = require("utils")

--u.global("nvim_tree_indent_markers",1)

--vim.g.nvim_tree_icons = {
--  --default = "",
--  default = "",
--  symlink = "",
--  git = {
--    unstaged = "M",
--    staged = "S",
--    unmerged = "",
--    renamed = "➜",
--    deleted = "",
--    untracked = "U",
--    --ignored = "◌",
--    ignored = "",
--  },
--  folder = {
--    -- arrow_open = " ",
--    -- arrow_closed = "",
--    default = "",
--    open = "",
--    empty = "",
--    empty_open = "",
--    symlink = "",
--  },
--}

require("nvim-tree").setup({

  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {'dashboard'},
  --auto_close = true,
  open_on_tab = false,
  hijack_cursor = false,
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
  },
	git = {
		enable = true,
		ignore = false
	},
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "M",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          --ignored = "◌",
          ignored = "",
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
      },
    },
  },


  --quit_on_open = 0,
  --git_hl = 1,
  --disable_window_picker = 0,
  --root_folder_modifier = ":t"
})

u.keymap("n", "<leader>m", ":NvimTreeToggle<CR>")
