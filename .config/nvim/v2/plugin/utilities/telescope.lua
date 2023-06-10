local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local u = require("utils")
local actions = require("telescope.actions")

u.global("theme_switcher_loaded", true)

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules", ".terraform", ".venv" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },

  extensions_list = { "themes", "terms" },
}

telescope.setup(options)

-- load extensions
pcall(function()
   for _, ext in ipairs(options.extensions_list) do
      telescope.load_extension(ext)
   end
end)

u.keymap("n", "<leader>tff", "<cmd> Telescope find_files <CR>")
u.keymap("n", "<leader>tfg", "<cmd> Telescope live_grep <CR>")

u.keymap("n", "<leader>tfa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
u.keymap("n", "<leader>tk", "<cmd> Telescope keymaps <CR>")
u.keymap("n", "<leader>tfb", "<cmd> Telescope buffers <CR>")

u.keymap("n", "<leader>tgb", "<cmd> Telescope git_branches <CR>")
u.keymap("n", "<leader>tgs", "<cmd> Telescope git_status <CR>")

u.keymap("n", "<leader>tgc", "<cmd> Telescope git_commits <CR>")