return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local present, nvim_comment = pcall(require, "Comment")

    if not present then
      return
    end

    local u = require("utils")

    local options = {
      opleader = {
        line = 'cl',
        block = 'cb'
      },
    }

    nvim_comment.setup(options)

  --[[   u.keymapFunction(
      "n",
     "<leader>/",
      function()
        require("Comment.api").toggle_current_linewise()
      end
    )

    u.keymapFunction(
      "v",
      "<leader>/",
      "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>"
    ) ]]

  end
}