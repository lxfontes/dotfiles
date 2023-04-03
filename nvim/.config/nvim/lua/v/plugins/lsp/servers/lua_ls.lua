local _ = {}

_.setup = function(on_attach, capabilities)
	require("neodev").setup()
	require("lspconfig").lua_ls.setup({
		on_attach = on_attach,
		settings = {
			prefer_null_ls = true,
			Lua = {
				workspace = {
					checkThirdParty = false,
				},
				completion = {
					workspaceWord = true,
					callSnippet = "Both",
				},
				misc = {
					parameters = {
						"--log-level=trace",
					},
				},
				diagnostics = {
					groupSeverity = {
						strong = "Warning",
						strict = "Warning",
					},
					groupFileStatus = {
						["ambiguity"] = "Opened",
						["await"] = "Opened",
						["codestyle"] = "None",
						["duplicate"] = "Opened",
						["global"] = "Opened",
						["luadoc"] = "Opened",
						["redefined"] = "Opened",
						["strict"] = "Opened",
						["strong"] = "Opened",
						["type-check"] = "Opened",
						["unbalanced"] = "Opened",
						["unused"] = "Opened",
					},
					unusedLocalExclude = { "_*" },
				},
				format = {
					enable = false,
				},
			},
		},
		capabilities = capabilities,
	})
end

return _
