local u = require "utils"

local options = {
  showmode = false, -- muestra el estado actual
  title = true, -- muestra el nombre del archivo en cuestion
  clipboard = "unnamedplus", -- te permite compartir del clipboard del host
  expandtab = true, -- utilizar el tab en modo insert
  shiftwidth = 2, -- numeros de tab utilizados
  smartindent = true, -- la sangria de pone automaticamente (*)
  ignorecase = true, -- ignora mayusculas y minusculas en patrones de busqueda
  smartcase = true, -- ignora 'ignorecase' si el patro de busqueda contiene mayusculas
  mouse = "a", -- habilita el uso de mouse ( a = todos los modos)
  number = true, -- muestra el numero de linea
  numberwidth = 1, -- el ancho de los numeros de la linea
  tabstop = 2, -- limite del tab
  termguicolors = true, -- habilita el color
  relativenumber = true, --muestra el numero relativo de numeros en la linea
  wrap = false, -- habilita si se muestra toda la linea o sigue de largo
  swapfile = false, -- no crea el archivo swap
  fileencoding = "utf-8",
  encoding = "utf-8",
  cursorline = true, --muestra el cursor
  softtabstop = 2, -- tab inteligente
  smarttab = true, -- habilita y el configura el tab segun 'softtabstop' - 'shiftwidth' - 'tabstop'

  --timeoutlen = 400,
  --updatetime = 250,
  --errorbells = false,     -- REVIEW
  --backup = false, -- REVIEW
  completeopt = { "menuone", "noselect" },
  --completeopt = { "menu", "menuone", "noselect", "preview" },
}

for k, v in pairs(options) do
  u.addOpt(k, v)
end

-- auto cmd
vim.cmd [[syntax enable]]
vim.cmd [[filetype plugin indent on]]

vim.opt.list = true
vim.opt.listchars = {
  space = "⋅",
  eol = " ", --"↴",
  tab = "▎_",
  -- tab = "|_>",
  trail = "•",
  extends = "❯",
  precedes = "❮",
  nbsp = "",
}
vim.opt.fillchars = {
  fold = " ",
  foldsep = " ",
  foldopen = "",
  foldclose = "",
  diff = "╱",
}
