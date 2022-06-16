local present, lualine = pcall(require, "lualine")

if not present then
  return
end

local colors = {
  blue = "#6791C9",
  cyan = "#67AFC1",
  black = "#061115",
  white = "#D9D7D6",
  red = "#DF5B61",
  purple = "#C488EC",
  grey = "#313c40"
}

local rxyhn = {
  normal = {
    a = { fg = colors.blue, bg = colors.black },
    b = { fg = colors.blue, bg = colors.black },
    c = { fg = colors.blue, bg = colors.black },
  },

  insert = { a = { fg = colors.white, bg = colors.black } },
  visual = { a = { fg = colors.grey, bg = colors.black } },
  replace = { a = { fg = colors.red, bg = colors.black } },

  inactive = {
    a = { fg = colors.white, bg = colors.grey },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.grey },
  },
}

local options = {
  options = {
    icons_enabled = true,
    theme = rxyhn,
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = ' ﰌ    ', right = '  '},
  },
  sections = {
    lualine_a = { { 'mode', upper = true } },
    lualine_b = { 'diff', { 'branch', icon = '' }, {'filename', path = 1} },
    lualine_c = {  },
    lualine_x = { { 'diagnostics', sources = { 'nvim_diagnostic' } }, 'filetype' },
    lualine_y = {'lineinfo', 'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'      '},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { "nvim-tree" }
}

lualine.setup(options)
