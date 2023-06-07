local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
		cmd = "NvimTreeToggle",
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"aca/emmet-ls",
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{ "b0o/schemastore.nvim", ft = { "json" } },

	{
		"github/copilot.vim",
		event = "BufEnter",
	},

	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		event = "BufEnter",
		opts = {
			-- configurations go here
		},
	},

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},

	{
		"folke/noice.nvim",
		-- lazy = false,
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					hover = {
						enabled = false,
					},
					signature = {
						enabled = false,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	{ "MunifTanjim/nui.nvim", lazy = false },

	{ "rcarriga/nvim-notify", lazy = false },

	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "jsx", "tsx" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	},

	{
		"barrett-ruth/live-server.nvim",
		build = "npm i -g live-server",
		ft = "html",
		config = function()
			require("live-server").setup()
		end,
	},

	{ "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },

	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
	},

	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
	--
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
			{
				"tzachar/cmp-tabnine",
				build = "./install.sh",
				config = function()
					local tabnine = require("cmp_tabnine.config")
					tabnine:setup({}) -- put your options here
				end,
			},
		},
		opts = function(_, opts)
			opts.formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			}
			opts.sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "cmp_tabnine" },
			}
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Oil",
	},

	{
		"mvllow/modes.nvim",
		tag = "v0.2.0",
		event = "BufEnter",
		config = function()
			require("modes").setup()
		end,
	},

	{
		"kosayoda/nvim-lightbulb",
		dependencies = "antoinemadec/FixCursorHold.nvim",
		event = "BufEnter",
		config = function()
			require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "BufEnter",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},

	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		config = function()
			require("persistence").setup()
		end,
	},
}

return plugins
