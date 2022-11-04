-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
	use 'navarasu/onedark.nvim'
	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate"
	})

	use "nvim-lua/plenary.nvim"
	use "nvim-telescope/telescope.nvim"
	use 'nvim-lua/popup.nvim'
	use 'nvim-telescope/telescope-media-files.nvim'

	use "sbdchd/neoformat"

	use "neovim/nvim-lspconfig"

	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-tree/nvim-tree.lua'

end)

