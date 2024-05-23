local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.ui" },
  { import = "plugins" },
  { import = "plugins.git" },
  { import = "plugins.sintax" },
  { import = "plugins.cmp" },
  { import = "plugins.lsp" },
}, {
  default = {
    lazy = true
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  ui = {
    border = "rounded"
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      }
    }
  }
})
