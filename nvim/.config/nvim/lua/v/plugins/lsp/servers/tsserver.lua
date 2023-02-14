local _wk, wk = pcall(require, "which-key")
local _ = {}

_.setup = function(on_attach, capabilities)
	require("typescript").setup({
		server = {
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				if _wk then
					wk.register({
						["<leader>t"] = {
							name = "TYPESCRIPT",
							["r"] = { "<CMD>TypescriptRemoveUnused<CR>", "[TYPESCRIPT] Remove Unused" },
							["o"] = { "<CMD>TypescriptOrganizeImports<CR>", "[TYPESCRIPT] ORGANIze Imports" },
							["a"] = { "<CMD>TypescriptAddMissingImports<CR>", "[TYPESCRIPT] Add Missing Imports" },
							["x"] = { "<CMD>TypescriptFixAll<CR>", "[TYPESCRIPT] Fix All" },
							["n"] = { "<CMD>TypescriptRenameFile<CR>", "[TYPESCRIPT] Rename File" },
						},
					}, {
						buffer = bufnr,
						mode = "n",
						prefix = "",
						silent = true,
						noremap = true,
						nowait = true,
					})
				end

				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
		},
	})
end

return _
