return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git" },
  keys = {
    { "<leader>fgl", "<cmd> diffget //3<CR>", desc = "aca va la descripcion 1" },
    { "<leader>fgr", "<cmd> diffget //2<CR>", desc = "aca va la descripcion 2" },
    { "<leader>fgs", "<cmd> G<CR>", desc = "aca va la descripcion 3" }
  }
}