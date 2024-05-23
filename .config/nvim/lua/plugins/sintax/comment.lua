return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = require("moise.configs.comment").config
}