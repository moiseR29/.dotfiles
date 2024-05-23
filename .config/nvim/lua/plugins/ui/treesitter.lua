return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  main = "nvim-treesitter.configs",
  opts = {
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
      "hcl"
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
