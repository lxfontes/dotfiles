local _ = {}

_.setup = function(on_attach, capabilities)
	local lspconfig = require("lspconfig")

	lspconfig.denols.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	})
end

return _
