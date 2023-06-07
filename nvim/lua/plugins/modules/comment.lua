return {
  "numToStr/Comment.nvim",
  keys = { "gcc", "gbc" },
  init = function()
    local map = vim.keymap.set

    map(
      "n",
      "<leader>/",
      function()
        require("Comment.api").toggle.linewise.current()
      end
    )

    map(
      "v",
      "<leader>/",
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"
    )
  end,
  config = function()
    require("Comment").setup()
  end,
}
