return {
	"folke/which-key.nvim",
    event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.register({
			["<leader>n"] = {
				name = "NVIMTREE",
				["n"] = { "<CMD>NvimTreeToggle<CR>", "[NVIMTREE] Toggle" },
				["r"] = { "<CMD>NvimTreeRefresh<CR>", "[NVIMTREE] Refresh" },
				["c"] = { "<CMD>NvimTreeCollapse<CR>", "[NVIMTREE] Collapse" },
			},
			["<C-b>"] = { "<CMD>NvimTreeToggle<CR>", "[NVIMTREE] Toggle" },

			["<leader>f"] = {
				name = "TELESCOPE",
				["f"] = { "<CMD>Telescope find_files hidden=true no_ignore=true<CR>", "[TELESCOPE] Find File" },
				["g"] = { "<CMD>Telescope live_grep<CR>", "[TELESCOPE] Find File by grep" },
				["b"] = { "<CMD>Telescope buffers<CR>", "[TELESCOPE] Find buffers" },
				["d"] = { "<CMD>Telescope diagnostics<CR>", "[TELESCOPE] Diagnostics" },
			},

			["<leader>g"] = {
				name = "GIT",
				["s"] = { "<CMD>Gitsigns toggle_signs<CR>", "[GIT] Toggle signs" },
				["h"] = { "<CMD>Gitsigns preview_hunk<CR>", "[GIT] Preview hunk" },
				["d"] = { "<CMD>Gitsigns diffthis<CR>", "[GIT] Diff" },
				["n"] = { "<CMD>Gitsigns next_hunk<CR>", "[GIT] Next hunk" },
				["p"] = { "<CMD>Gitsigns prev_hunk<CR>", "[GIT] Prev hunk" },
				["f"] = { "<CMD>Telescope git_status<CR>", "[GIT] Files Status" },
				["c"] = { "<CMD>Telescope git_commits<CR>", "[GIT] Commits" },
				["b"] = { "<CMD>Telescope git_branches<CR>", "[GIT] Branches" },
			},

			["<leader>]"] = { "<CMD>bn<CR>", "[BUFFER] Next buffer" },
			["<leader>["] = { "<CMD>bp<CR>", "[BUFFER] Previous buffer" },
			["<leader>q"] = { "<CMD>bd<CR>", "[BUFFER] Close current buffer" },
			["<leader>Q"] = { "<CMD>%bd|e#|bd#<CR>", "[BUFFER] Close other buffers" },

			["<C-n>"] = { "<CMD>tabnew<CR>", "[TAB] New tab" },
			["<C-]>"] = { "<CMD>tabnext<CR>", "[TAB] Next tab" },
			["<C-[>"] = { "<CMD>tabprevious<CR>", "[TAB] Previous tab" },
			["<C-q>"] = { "<CMD>tabclose<CR>", "[TAB] Close current tab" },
		}, {
			mode = "n",
			prefix = "",
			silent = true,
			noremap = true,
			nowait = true,
		})

		wk.setup({
			icons = {
				breadcrumb = "",
				separator = "",
				group = " ",
			},
			key_labels = {
				["<space>"] = "SPACE",
				["<leader>"] = "SPACE",
				["<cr>"] = "RETURN",
				["<tab>"] = "TAB",
			},
		})
	end,
}
