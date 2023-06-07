return {
  "windwp/nvim-ts-autotag",
  ft = { "html", "jsx", "tsx" },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
