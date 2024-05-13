return {
	"nvim-tree/nvim-tree.lua",
	init = function()
		local map = vim.keymap.set

		map("n", "<c-n>", "<cmd> NvimTreeToggle <cr>")
	end,
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	config = function()
		require("nvim-tree").setup({
			disable_netrw = true,
		})
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
}
