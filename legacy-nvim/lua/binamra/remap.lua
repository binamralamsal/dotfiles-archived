local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Paste from clipboard
keymap("n", "<leader>sp", "\"+p", opts)
keymap("n", "<leader>sP", "\"+P", opts)

-- Save shortcut
keymap("n", "<leader>w", ":w<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==g", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==g", opts)


-- Plugins --
-- Telescope --
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<leader>fm", "<cmd>Telescope media_files<CR>", opts)

-- Nvim Tree --
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- Toggle Term --
keymap("n", "td", "<cmd>ToggleTerm<CR>", opts)

-- Tagbar --
keymap("n", "<leader>gh", "<cmd>TagbarToggle<CR>", opts)


-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Ctrl + Backspace --
keymap("i", "<C-Backspace", "<C-W>", opts)

-- Term --
keymap('t', '<esc>', [[<C-\><C-n>]], opts)
keymap('t', 'jk', [[<C-\><C-n>]], opts)

-- Move out Toggle Term --
keymap('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
keymap('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
keymap('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
keymap('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
keymap('t', '<C-w>', "<Cmd>q<CR>", opts)

vim.api.nvim_create_user_command("OpenTerminal", function()
	local value = vim.fn.input "Terminal number: "
	vim.cmd(":ToggleTerm "..value)
end, {})

keymap("n", "tt", ":OpenTerminal <CR>", opts)

-- Buffer --
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>q", ":bdelete<CR>:bnext<CR>", opts)


-- Visual --
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
