return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
	init = function()
		local map = vim.keymap.set

		map("n", "<space>e", vim.diagnostic.open_float)
		map("n", "[d", vim.diagnostic.goto_prev)
		map("n", "]d", vim.diagnostic.goto_next)
		map("n", "<space>q", vim.diagnostic.setloclist)
		map("n", "gD", vim.lsp.buf.declaration)
		map("n", "gd", vim.lsp.buf.definition)
		map("n", "K", vim.lsp.buf.hover)
		map("n", "gi", vim.lsp.buf.implementation)
		map("n", "<C-k>", vim.lsp.buf.signature_help)
		map("n", "<space>wa", vim.lsp.buf.add_workspace_folder)
		map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder)
		map("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end)
		map("n", "<space>D", vim.lsp.buf.type_definition)
		map("n", "<space>rn", vim.lsp.buf.rename)
		map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action)
		map("n", "gr", vim.lsp.buf.references)
		map("n", "<space>fm", function()
			vim.lsp.buf.format({ async = true })
		end)
	end,
	config = function()
		require("mason").setup()

		local servers = {
			"jsonls",
			"tsserver",
			"cssls",
			"html",
			"cssmodules_ls",
			"docker_compose_language_service",
			"dockerls",
			"emmet_ls",
			"svelte",
			"tailwindcss",
		}
		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = lsp_capabilities,
				})
			end,
		})

		require("lspconfig").lua_ls.setup({
			capabilities = lsp_capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})

		lspconfig.jsonls.setup({
			capabilities = lsp_capabilities,
			filetypes = { "json", "jsonc" },
			init_options = {
				provideFormatter = true,
			},
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
			end,
		})

		local signs = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		}

		for _, sign in ipairs(signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end

		local config = {
			signs = {
				active = signs, -- show signs
			},
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(config)
	end,
	build = ":MasonUpdate",
}
