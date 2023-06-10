local present, autopairs = pcall(require, "nvim-autopairs")
local secondPresent, cmp = pcall(require, "cmp")

if not present then
  return
end

local options = {
  fast_wrap = { },
  disable_filetype = { "TelescopePromp", "vim" }
}

autopairs.setup(options)

if secondPresent then
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end