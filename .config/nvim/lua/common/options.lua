local options = {
  laststatus = 3,             -- *
  --statusline = "%!v:lua.require'ui.statusline'.run()",
  showmode = false,
  title = true,               -- *
  clipboard = "unnamedplus",
  expandtab = true,
  shiftwidth = 2,
  smartindent = true,
  ignorecase = true,      -- REVIEW
  smartcase = true,      -- REVIEW *
  mouse = "a",
  number = true,
  numberwidth = 1,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 400,
  updatetime = 250,

  --errorbells = false,     -- REVIEW
  relativenumber = true,
  wrap = false,           -- REVIEW
  swapfile = false,       -- REVIEW
  backup = false,         -- REVIEW
  fileencoding = "utf-8",
  encoding = "utf-8",
  cursorline = true,
  smarttab = true,        -- REVIEW
  softtabstop = 2,
  completeopt = { "menuone", "noselect" },
}

-- g
--[[ {
  nvchad_theme = "onedark",
  toggle_theme_icon = "   ",
  transparency = false,
  theme_switcher_loaded = false,

  did_load_filetypes = 0,
  do_filetype_lua = 1
} ]]

-- Synax enable
--vim.cmd('syntax enable')

--vim.cmd('filetype plugin indent on')


for k,v in pairs(options) do
  vim.opt[k] = v
end

local default_plugins = {
   "syntax",
}

for _, plugin in pairs(default_plugins) do
   vim.g["loaded_" .. plugin] = 1
end
