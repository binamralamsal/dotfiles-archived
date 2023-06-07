return {
  "lukas-reineke/indent-blankline.nvim",
  init = function()
    local map = vim.keymap.set

    map( "n", "<leader>cc",
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end)
  end,
  config = function()
    require("indent_blankline").setup()
  end,
}
