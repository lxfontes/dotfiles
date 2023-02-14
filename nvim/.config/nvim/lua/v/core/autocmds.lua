local autocmd = vim.api.nvim_create_autocmd

local function set_indent_size(size)
	vim.api.nvim_buf_set_option(0, "shiftwidth", size)
	vim.api.nvim_buf_set_option(0, "tabstop", size)
	vim.api.nvim_buf_set_option(0, "softtabstop", size)
end

autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})

autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		vim.api.nvim_buf_set_option(
			0,
			"formatoptions",
			(string.gsub(vim.api.nvim_buf_get_option(0, "formatoptions"), "[cro]", ""))
		)
	end,
})

autocmd("FileType", {
	pattern = { "lua", "rust", "go", "gitconfig" },
	callback = function()
		set_indent_size(4)
	end,
})

autocmd("FileType", {
	pattern = "make",
	callback = function()
		set_indent_size(4)
		vim.api.nvim_buf_set_option(0, "expandtab", false)
	end,
})
