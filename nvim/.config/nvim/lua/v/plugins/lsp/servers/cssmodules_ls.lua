local _ = {}

_.setup = function(on_attach, capabilities)
    require("lspconfig").cssmodules_ls.setup({
		on_attach = on_attach,
		filetypes = { "javascriptreact", "typescriptreact" },
		capabilities = capabilities,
	})
end

return _
