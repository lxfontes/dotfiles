local _ = {}

_.setup = function(on_attach, capabilities)
    require("lspconfig").emmet_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "html" },
	})
end

return _
