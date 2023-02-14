local _ = {}

_.setup = function(on_attach, capabilities)
	require("lspconfig").yamlls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			yaml = {
				schemas = {
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				},
			},
		},
	})
end

return _
