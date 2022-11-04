local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

require("base46").load_highlight "syntax"
require("base46").load_highlight "treesitter"

local options = {
  ensure_installed = { "python", "javascript", "typescript", "go", "lua", "markdown", "yaml", "json", "bash", "hcl" },
  --sync_install = false,
  --ignore_install = { "" },
  --autopairs = {
  --  enable = true,
  --},
  highlight = {
    enable = true,
    use_languagetree = true,
    --disable = { "" },
    --additional_vim_regex_highlighting = true,
  },
  --indent = { enable = true, disable = { "yaml" } },
  --context_commentstring = {
  --  enable = true,
  --  enable_autocmd = false,
  --},
}

treesitter.setup(options)
