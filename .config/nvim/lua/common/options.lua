local options = {
  mouse = "a",
  --errorbells = false,     -- REVIEW
  smartindent = true,
  number = true,
  relativenumber = true,
  numberwidth = 1,
  wrap = false,           -- REVIEW
  swapfile = false,       -- REVIEW
  backup = false,         -- REVIEW
 --incsearch
  ignorecase = true,      -- REVIEW
  clipboard = "unnamedplus",
  fileencoding = "utf-8",
  encoding = "utf-8",
  cursorline = true,
  showmode = false,
  expandtab = true,
  smarttab = true,        -- REVIEW
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  completeopt = { "menuone", "noselect" },
  guifont="Meslo LG S DZ 12",
  termguicolors = true
}

-- Synax enable
vim.cmd('syntax enable')

vim.cmd('filetype plugin indent on')

for k,v in pairs(options) do
  vim.opt[k] = v
end
