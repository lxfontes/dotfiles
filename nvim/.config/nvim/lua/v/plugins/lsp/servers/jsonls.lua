local _ = {}

_.setup = function(on_attach, capabilities)
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	require("lspconfig").jsonls.setup({
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			on_attach(client, bufnr)
		end,
		capabilities = capabilities,
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
			},
		},
		init_options = {
			provideFormatter = true,
		},
	})
end

return _
