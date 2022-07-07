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
  grey = "#313c40",
}

local colorsOneDark = {
  blue = "#61afef",
  cyan = "#a3b8ef",
  black = "#1e222a",
  white = "#abb2bf",
  red = "#e06c75",
  purple = "#de98fd",
  grey = "#42464e",
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

local oneDark = {
  normal = {
    a = { fg = colorsOneDark.blue, bg = colorsOneDark.black },
    b = { fg = colorsOneDark.blue, bg = colorsOneDark.black },
    c = { fg = colorsOneDark.blue, bg = colorsOneDark.black },
  },

  insert = { a = { fg = colorsOneDark.white, bg = colorsOneDark.black } },
  visual = { a = { fg = colorsOneDark.grey, bg = colorsOneDark.black } },
  replace = { a = { fg = colorsOneDark.red, bg = colorsOneDark.black } },

  inactive = {
    a = { fg = colorsOneDark.white, bg = colorsOneDark.grey },
    b = { fg = colorsOneDark.white, bg = colorsOneDark.grey },
    c = { fg = colorsOneDark.white, bg = colorsOneDark.grey },
  },
}

local options = {
  options = {
    icons_enabled = true,
    theme = oneDark,
    component_separators = { left = " ﰌ    ", right = " " },
    section_separators = { left = " ", right = "  " },
  },
  sections = {
    lualine_a = { { "mode", upper = true } },
    lualine_b = { "diff", { "branch", icon = "" }, { "filename", path = 1 } },
    lualine_c = {},
    lualine_x = { { "diagnostics", sources = { "nvim_diagnostic" } }, "filetype" },
    lualine_y = { "lineinfo", "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "      " },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { "nvim-tree" },
}

lualine.setup(options)
