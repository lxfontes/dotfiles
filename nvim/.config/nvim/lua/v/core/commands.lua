local command = vim.api.nvim_create_user_command

command("Format", function()
	vim.lsp.buf.format({ async = true, timeout = 5000 })
end, {})
