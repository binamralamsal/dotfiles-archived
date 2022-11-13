require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    number = false,
		timeout = 0,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}
