return {
  "Mofiqul/vscode.nvim",
  --"ayu-theme/ayu-vim",
  --"wuelnerdotexe/vim-enfocado",
  lazy = false,
  enabled = true,
  priority = 1000,
  config = function ()
    local vscode = require("vscode")

    vscode.setup({
        stype = 'dark',
        --transparent = false,,
        --disable_nvimtree_bg = false
        transparent = true,
        disable_nvimtree_bg = true

    })

    vscode.load()
  end
}