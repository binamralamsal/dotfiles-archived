return {
  "ziontee113/color-picker.nvim",
  ft = { "css", "scss", "sass" },
  init = function()
    local map = vim.keymap.set

    map("n", "<C-c>", "<cmd>PickColor<cr>")
    map("i", "<C-c>", "<cmd>PickColorInsert<cr>")
  end,
  config = function()
    require("color-picker")
  end
}
