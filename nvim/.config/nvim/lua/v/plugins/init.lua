local plugins = {}

table.insert(plugins, require("v.plugins.lsp"))
table.insert(plugins, require("v.plugins.catppuccin"))
table.insert(plugins, require("v.plugins.cmp"))
table.insert(plugins, require("v.plugins.comment"))
table.insert(plugins, require("v.plugins.devicons"))
table.insert(plugins, require("v.plugins.diffview"))
table.insert(plugins, require("v.plugins.fidget"))
table.insert(plugins, require("v.plugins.lualine"))
table.insert(plugins, require("v.plugins.gitsigns"))
table.insert(plugins, require("v.plugins.indent"))
table.insert(plugins, require("v.plugins.markdown"))
table.insert(plugins, require("v.plugins.nvimtree"))
table.insert(plugins, require("v.plugins.signature"))
table.insert(plugins, require("v.plugins.surround"))
table.insert(plugins, require("v.plugins.telescope"))
table.insert(plugins, require("v.plugins.treesitter"))
table.insert(plugins, require("v.plugins.which_key"))

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

local home = os.getenv("HOME")
local cache = home .. "/.cache/nvim"
vim.opt.runtimepath:prepend(cache)

require("lazy").setup(plugins, {
	defaults = { lazy = true },
	install = {
		missing = true,
		colorscheme = { "catppuccin-macchiato" },
	},
	checker = { enabled = false, notify = false },
	change_detection = {
		enabled = false,
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
			path = cache .. "/lazy/cache",
			disable_events = { "VimEnter", "BufReadPre" },
		},
		rtp = {
			reset = true,
			disabled_plugins = {
				"gzip",
				"zip",
				"zipPlugin",
				"fzf",
				"tar",
				"tarPlugin",
				"getscript",
				"getscriptPlugin",
				"vimball",
				"vimballPlugin",
				"2html_plugin",
				"matchit",
				"matchparen",
				"logiPat",
				"rrhelper",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
			},
		},
	},
})
