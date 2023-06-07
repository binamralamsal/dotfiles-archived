return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      extensions = { "nvim-tree", "lazy" },
      options = {
        theme = 'onedark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      }
    })
  end,
}
