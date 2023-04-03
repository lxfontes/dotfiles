local _ = {}

_.setup = function(on_attach, capabilities)
	local lspconfig = require("lspconfig")

	lspconfig.rome.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		root_dir = lspconfig.util.root_pattern("rome.json"),
		single_file_support = false,
	})
end

return _
