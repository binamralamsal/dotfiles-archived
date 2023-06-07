return {
  "nvim-telescope/telescope-ui-select.nvim",
  event = "BufEnter",
  config = function()
    require("telescope").load_extension("ui-select")
  end,
}
