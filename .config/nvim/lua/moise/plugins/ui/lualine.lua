return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function ()
    local lualine = require("lualine")

    local colors = {
      blue = "#6791C9",
      cyan = "#67AFC1",
      black = "#061115",
      white = "#D9D7D6",
      red = "#DF5B61",
      purple = "#C488EC",
      grey = "#313c40",
      turq = '33FFF0'
    }

    local rxyhn = {
      normal = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.blue, bg = colors.black },
        c = { fg = colors.blue, bg = colors.black },
      },

      insert = { a = { fg = colors.black, bg = colors.turq } },
      visual = { a = { fg = colors.grey, bg = colors.purple } },
      replace = { a = { fg = colors.red, bg = colors.black } },

      inactive = {
        a = { fg = colors.white, bg = colors.grey },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = colors.grey },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = rxyhn,
      },
      sections = {
        lualine_a = { { "mode", upper = true } },
        lualine_b = { "diff", { "branch", icon = "" } },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { { "diagnostics", sources = { "nvim_diagnostic" } }, "filetype" },
        lualine_y = { "lineinfo", "progress" },
        lualine_z = { "location" },
      },
      extensions = { "nvim-tree", "fugitive" },
    })
  end
}
