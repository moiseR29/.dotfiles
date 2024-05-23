local h = {}

h.config = function ()
  local present, bufferline = pcall(require, "bufferline")
  local u = require "utils"
  
  if not present then
    return
  end
  local options = {
    options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      show_close_icon = false,
      left_trunc_marker = " ",
      right_trunc_marker = " ",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
      themable = true,
    },
  }
  
  bufferline.setup(options)

  -- next
  u.keymap("n", "<TAB>", "<cmd> BufferLineCycleNext <CR>")
  
  -- prev
  u.keymap("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")

  --  New Buffer
  u.keymap("n", "<S-b>", "<cmd> enew <CR>")
  
  -- close buffer
  u.keymapFunction("n", "<A-w>", function()
    u.close_buffer()
  end)

end

return h



