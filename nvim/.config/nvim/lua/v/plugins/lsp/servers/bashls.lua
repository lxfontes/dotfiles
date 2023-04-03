local _ = {}

_.setup = function(on_attach, capabilities)
    require("lspconfig").bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		cmd_env = {
			GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|.zsh)",
		},
		filetypes = { "sh", "zsh" },
	})
end

return _
