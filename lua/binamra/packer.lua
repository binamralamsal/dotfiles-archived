-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim' -- Packer for installing packages
	use 'navarasu/onedark.nvim' -- Color theme
	use("nvim-treesitter/nvim-treesitter", { -- For better syntax highlighting
		run = ":TSUpdate"
	})

	use "nvim-lua/plenary.nvim" -- Some packages depend upon it
	use "nvim-telescope/telescope.nvim" -- Fuzzy searching in files
	use 'nvim-lua/popup.nvim' -- Some packages depend upon it
	use 'nvim-telescope/telescope-media-files.nvim' -- Supposedly shows media files but doesn't work properly
	use "sbdchd/neoformat" -- Helps to format on save and integrate with prettier or so on
	use "neovim/nvim-lspconfig"
	use 'nvim-tree/nvim-web-devicons' -- Icon for Nvim tree
	use 'nvim-tree/nvim-tree.lua' -- File explorer viewer
	use 'winston0410/commented.nvim' -- Provides a way to comment lines easily
	use 'jiangmiao/auto-pairs' -- Helps to complete brackets, quotes, etc.
	use 'akinsho/toggleterm.nvim' -- Terminal for Neovim
	use 'kyazdani42/nvim-web-devicons' -- Icons required by lua line
	use 'nvim-lualine/lualine.nvim' -- Beautiful lualine
	use 'akinsho/bufferline.nvim' -- Buffer line like tabs

end)

