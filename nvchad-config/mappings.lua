---@type MappingsTable
local M = {}

local opts = { noremap = true, silent = true }

M.general = {
  n = {
    -- Resize with arrows
    ["<C-Up>"] = { ":resize -2<CR>", "Decrease height", opts },
    ["<C-Down>"] = { ":resize +2<CR>", "Increase height", opts },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "Increase width", opts },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "Decrease width", opts },

    -- Move text up and down
    ["<A-j>"] = { "<Esc>:m .+1<CR>==g", "Move text down", opts },
    ["<A-k"] = { "<Esc>:m .-2<CR>==g", "Move text up", opts },
  },
}

return M
