local u = require "utils"
local M = {}
--local g = vim.g

local config = {
  ui = {
    hl_override = {},
    hl_add = {},
    changed_themes = {},
    theme_toggle = { "rxyhn", "nightowl" },
    transparency = false,
    theme = "nightowl",
    toggle_theme_icon = "   ",
  },
}

M.configg = config

M.get_theme_tb = function(type)
  local default_path = "theme.themes." .. config.ui.theme
  local present1, default_theme = pcall(require, default_path)

  if present1 then
    return default_theme[type]
  else
    error "No such theme bruh >_< "
  end
end

M.merge_tb = function(table1, table2)
  return u.merge(table1, table2)
end

M.clear_highlights = function(hl_group)
  local highlights_raw = vim.split(vim.api.nvim_exec("filter " .. hl_group .. " hi", true), "\n")
  local highlight_groups = {}

  for _, raw_hi in ipairs(highlights_raw) do
    table.insert(highlight_groups, string.match(raw_hi, hl_group .. "%a+"))
  end

  for _, highlight in ipairs(highlight_groups) do
    vim.cmd([[hi clear ]] .. highlight)
  end
end

--[[ M.load_all_highlights = function()
   local reload = require("plenary.reload").reload_module

   M.clear_highlights "BufferLine"
   M.clear_highlights "TS"

   reload "theme.integrations"
   reload "theme.lights"

   local hl_groups = require "theme.lights"

   for hl, col in pairs(hl_groups) do
      vim.api.nvim_set_hl(0, hl, col)
   end
end ]]

M.turn_str_to_color = function(tb)
  local colors = M.get_theme_tb "base_30"

  for _, groups in pairs(tb) do
    for k, v in pairs(groups) do
      if k == "fg" or k == "bg" then
        if v:sub(1, 1) == "#" or v == "none" or v == "NONE" then
        else
          groups[k] = colors[v]
        end
      end
    end
  end

  return tb
end

M.extend_default_hl = function(highlights)
  local glassy = require "theme.glassy"
  local polish_hl = M.get_theme_tb "polish_hl"

  if polish_hl then
    -- polish themes
    for key, value in pairs(polish_hl) do
      if highlights[key] then
        highlights[key] = value
      end
    end
  end

  -- transparency
  if config.ui.transparency then
    -- highlights_tb = M.merge_tb(highlights_tb,)
    for key, value in pairs(glassy) do
      if highlights[key] then
        highlights[key] = value
      end
    end
  end

  local overriden_hl = M.turn_str_to_color(config.ui.hl_override)

  for key, value in pairs(overriden_hl) do
    if highlights[key] then
      highlights[key] = value
    end
  end
end

M.load_highlight = function(group)
  if type(group) == "string" then
    group = require("theme.integrations." .. group)
    M.extend_default_hl(group)
  else
    group = group
  end

  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

M.load_theme = function()
  -- set bg option
  local theme_type = M.get_theme_tb "type" -- dark/light
  vim.opt.bg = theme_type

  M.load_highlight "defaults"
  M.load_highlight "statusline"
  M.load_highlight(M.turn_str_to_color(config.ui.hl_add))
end

M.override_theme = function(default_theme, theme_name)
  local changed_themes = config.ui.changed_themes

  if changed_themes[theme_name] then
    return M.merge_tb(default_theme, changed_themes[theme_name])
  else
    return default_theme
  end
end

M.toggle_theme = function()
  local themes = config.ui.theme_toggle

  local theme1 = themes[1]
  local theme2 = themes[2]

  if config.ui.theme == theme1 or config.ui.theme == theme2 then
    if config.ui.toggle_theme_icon == "   " then
      config.ui.toggle_theme_icon = "   "
    else
      config.ui.toggle_theme_icon = "   "
    end
  end

  if config.ui.theme == theme1 then
    config.ui.theme = theme2

    M.reload_theme(config.ui.theme)
    --ex.change_theme(theme1, theme2)
  elseif config.ui.theme == theme2 then
    config.ui.theme = theme1

    M.reload_theme(config.ui.theme)
    --ex.change_theme(theme2, theme1)
  else
    vim.notify "Set your current theme to one of those mentioned in the theme_toggle table (chadrc)"
  end
end

M.toggle_transparency = function()
  --[[   local transparency_status = config.ui.transparency
  local write_data = ex.wwrite_data

  local function saverc()
    local old_data = "transparency = " .. tostring(transparency_status)
    local new_data = "transparency = " .. tostring(transparency_status)

    write_data(old_data, new_data)
  end ]]

  if config.ui.transparency then
    config.ui.transparency = false
    M.load_all_highlights()
  else
    config.ui.transparency = true
    M.load_all_highlights()
  end
end

M.filee = function(mode, filepath, content)
  local data
  local base_dir = vim.fn.fnamemodify(filepath, ":h")
  -- check if file exists in filepath, return false if not
  if mode == "r" and vim.fn.filereadable(filepath) == 0 then
    return false
  end
  -- check if directory exists, create it and all parents if not
  if mode == "w" and vim.fn.isdirectory(base_dir) == 0 then
    vim.fn.mkdir(base_dir, "p")
  end
  local fd = assert(vim.loop.fs_open(filepath, mode, 438))
  local stat = assert(vim.loop.fs_fstat(fd))
  if stat.type ~= "file" then
    data = false
  else
    if mode == "r" then
      data = assert(vim.loop.fs_read(fd, stat.size, 0))
    else
      assert(vim.loop.fs_write(fd, content, 0))
      data = true
    end
  end
  assert(vim.loop.fs_close(fd))
  return data
end

M.wwrite_data = function(old_data, new_data)
  local file_fn = M.filee
  local file = vim.fn.stdpath "config" .. "/lua/" .. "mmrc.lua"
  local data = file_fn("r", file)

  local content = string.gsub(data, old_data, new_data)

  -- see if the find string exists in file
  assert(file_fn("w", file, content))
end

M.load_all_highlights = function()
  vim.opt.bg = M.get_theme_tb "type"

  local reload = require("plenary.reload").reload_module
  local clear_hl = M.clear_highlights

  clear_hl "BufferLine"
  clear_hl "TS"

  reload "theme.integrations"
  reload "theme.lights"

  local hl_groups = require "theme.lights"

  for hl, col in pairs(hl_groups) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

M.reload_theme = function(theme_name)
  if theme_name == nil or theme_name == "" then
    theme_name = "onedark"
  end

  local default_themes = pcall(require, "theme.themes." .. theme_name)

  if not default_themes then
    print("No such theme ( " .. theme_name .. " )")
    return false
  end

  M.load_all_highlights()
  return theme_name
end

M.change_theme = function(current_theme, new_theme)
  if current_theme == nil or new_theme == nil then
    print "Error: Provide current and new theme name"
    return false
  end

  if current_theme == new_theme then
    return
  end

  local file_fn = M.filee
  local file = vim.fn.stdpath "config" .. "/lua/" .. "mmrc.lua"

  -- store in data variable
  local data = file_fn("r", file)

  -- check if data is false or nil and create a default file if it is
  if not data then
    file_fn("w", file, 'local M = {}\n\nM.ui = {\n   theme = "' .. new_theme .. '",\n}\n\nreturn M')
    data = file_fn("r", file)
  end

  -- if the file was still not created, then something went wrong
  if not data then
    print(
      "Error: Could not create: "
        .. file
        .. ". Please create it manually to set a default "
        .. "theme. Look at the documentation for more info."
    )
    return false
  end

  -- escape characters which can be parsed as magic chars
  current_theme = current_theme:gsub("%p", "%%%0")
  new_theme = new_theme:gsub("%p", "%%%0")

  local old_theme_txt = "theme = .?" .. current_theme .. ".?"
  local new_theme_txt = 'theme = "' .. new_theme .. '"'

  M.wwrite_data(old_theme_txt, new_theme_txt)
end

return M
