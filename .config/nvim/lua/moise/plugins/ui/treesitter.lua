return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local treesitter = require "nvim-treesitter.configs"

    treesitter.setup {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "go",
        "gomod",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "sql",
        "typescript",
        "regex",
        "vim",
        "yaml",
        "dockerfile",
        "python",
        "hcl",
      },
    }
  end,
}
