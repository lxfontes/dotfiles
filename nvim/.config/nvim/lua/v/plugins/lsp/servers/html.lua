local _ = {}

_.setup = function(on_attach, capabilities)
	require("lspconfig").html.setup({
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			on_attach(client, bufnr)
		end,
		capabilities = capabilities,
	})
end

return _
