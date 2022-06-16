require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
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
  extensions = {"fugitive"}
}
