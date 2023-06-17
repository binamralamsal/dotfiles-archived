local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

capabilities.offsetEncoding = { "utf-16" }

-- if you just want default config for the servers then put them in a table
local servers = {
	"html",
	"cssls",
	"tsserver",
	"clangd",
	"tailwindcss",
	"clangd",
	"vuels",
	"dockerls",
	"cssmodules_ls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.emmet_ls.setup({
	init_options = {
		html = {
			options = {
				["bem.enabled"] = true,
			},
		},
	},
})

lspconfig.jsonls.setup({
	capabilities = capabilities,
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

lspconfig.phpactor.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	init_options = {
		language_server_phpstan = { enabled = false },
		language_server_psalm = { enabled = false },
	},
})
