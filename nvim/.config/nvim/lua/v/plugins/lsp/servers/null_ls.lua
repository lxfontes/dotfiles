local _null_ls, null_ls = pcall(require, "null-ls")

if not _null_ls then
	return
end

local include_root_file = function(...)
	local files = { ... }
	return function(utils)
		return utils.root_has_file(files)
	end
end

local exclude_root_file = function(...)
	local files = { ... }
	return function(utils)
		return not utils.root_has_file(files)
	end
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local _ = {}

_.setup = function(on_attach)
	null_ls.setup({
		save_after_format = true,
		sources = {
			diagnostics.hadolint,
			diagnostics.tidy,
			diagnostics.markdownlint,
			diagnostics.shellcheck,
			diagnostics.alex,
			diagnostics.write_good,
			diagnostics.checkmake,

			formatting.prettierd.with({
				condition = exclude_root_file({ "rome.json" }),
			}),
			formatting.stylua,
			formatting.shfmt.with({
				filetypes = { "sh", "bash", "zsh" },
			}),
			formatting.gofumpt,

			code_actions.shellcheck,
		},
		on_attach = on_attach,
	})
end

return _
