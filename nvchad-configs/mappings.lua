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

		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

		-- Move text up and down
		["<A-j>"] = { "<Esc>:m .+1<CR>==g", "Move text down", opts },
		["<A-k"] = { "<Esc>:m .-2<CR>==g", "Move text up", opts },

		-- ["<C-m>"] = { "<cmd>NnnPicker %:p:h<CR>", "NnnPicker" },

		["-"] = { "<cmd>Oil<cr>", "Open Oil" },
	},
}

M.trouble_nvim = {
	n = {
		["<leader>ee"] = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
		["<leader>ew"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble Toggle Workspace Diagnostics" },
		["<leader>ed"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble Toggle Document Diagnostics" },
		["<leader>eq"] = { "<cmd>TroubleToggle quickfix<cr>", "Trouble Toggle Quickfixes" },
		["<leader>el"] = { "<cmd>TroubleToggle loclist<cr>", "Trouble Toggle loclist" },
		["<leader>gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble Toggle LSP References" },
	},
}

M.lspconfig = {
	plugin = true,

	-- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
	i = {
		["<C-f>"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"LSP signature help",
		},
	},

	n = {
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"LSP declaration",
		},

		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"LSP definition",
		},

		["K"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"LSP hover",
		},

		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"LSP implementation",
		},

		["<leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"LSP signature help",
		},

		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"LSP definition type",
		},

		["<leader>ra"] = {
			function()
				require("nvchad_ui.renamer").open()
			end,
			"LSP rename",
		},

		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"LSP code action",
		},

		["gr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"LSP references",
		},

		["<leader>f"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic",
		},

		["[d"] = {
			function()
				vim.diagnostic.goto_prev({ float = { border = "rounded" } })
			end,
			"Goto prev",
		},

		["]d"] = {
			function()
				vim.diagnostic.goto_next({ float = { border = "rounded" } })
			end,
			"Goto next",
		},

		["<leader>q"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"Diagnostic setloclist",
		},

		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"LSP formatting",
		},

		["<leader>wa"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"Add workspace folder",
		},

		["<leader>wr"] = {
			function()
				vim.lsp.buf.remove_workspace_folder()
			end,
			"Remove workspace folder",
		},

		["<leader>wl"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"List workspace folders",
		},
	},
}

return M
