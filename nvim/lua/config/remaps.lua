vim.g.mapleader = " "

local map = vim.keymap.set

--
-- normal mode --
--

-- clear highlights
map("n", "<esc>", ":noh <cr>")

-- switch between windows
map("n", "<c-h>", "<c-w>h")
map("n", "<c-l>", "<c-w>l")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")

-- save
map("n", "<leader>s", "<cmd> w <cr>")

-- close
map("n", "<leader>q", "<cmd> q <cr>")

-- copy whole file
map("n", "<c-c>", "<cmd> %y+ <cr>")

-- buffer
map("n", "<leader>b", "<cmd> enew <cr>")
map("n", "<leader>x", "<cmd> BufferClose <cr>")
map("n", "<s-h>", "<cmd> BufferPrevious <cr>")
map("n", "<s-l>", "<cmd> BufferNext <cr>")


--
-- insert mode --
--

-- go to beginning and end
map("i", "<c-b>", "<esc>^i")
map("i", "<c-e>", "<end>")

-- navigate within insert mode
map("i", "<c-h>", "<left>")
map("i", "<c-l>", "<right>")
map("i", "<c-j>", "<down>")
map("i", "<c-k>", "<up>")
