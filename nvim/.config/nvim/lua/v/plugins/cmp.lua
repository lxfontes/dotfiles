return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",

		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",

		"rafamadriz/friendly-snippets",
		"kitagry/vs-snippets",
		"burkeholland/simple-react-snippets",
	},
	config = function()
		local cmp = require("cmp")

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local feedkey = function(key, mode)
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
		end

		local kinds = {
			Text = "",
			Method = "",
			Function = "",
			Constructor = "ﰕ",
			Field = "ﰠ",
			Variable = "󰍳",
			Class = "ﴯ",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "塞",
			Value = "",
			Enum = "",
			Keyword = "󰿦",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "פּ",
			Event = "",
			Operator = "",
			TypeParameter = "",
		}

		cmp.setup({
			enabled = function()
				local in_prompt = vim.api.nvim_buf_get_option(0, "buftype") == "prompt"
				if in_prompt then
					return false
				end
				local context = require("cmp.config.context")
				return not (context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment"))
			end,
			experimental = {
				ghost_text = true,
			},
			confirmation = {
				get_commit_characters = function()
					return {}
				end,
			},
			view = {
				entries = "custom",
			},
			completion = {
				completeopt = "longest,menuone",
				keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
				keyword_length = 1,
			},
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 0,
				},
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(_, vim_item)
					vim_item.menu = vim_item.kind
					vim_item.kind = " " .. kinds[vim_item.kind] .. " "

					return vim_item
				end,
			},
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			mapping = {
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn["vsnip#available"](1) == 1 then
						feedkey("<Plug>(vsnip-expand-or-jump)", "")
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn["vsnip#jumpable"](-1) == 1 then
						feedkey("<Plug>(vsnip-jump-prev)", "")
					end
				end, { "i", "s" }),
				["<Down>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.fn["vsnip#available"](1) == 1 then
						feedkey("<Plug>(vsnip-expand-or-jump)", "")
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<Up>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.fn["vsnip#jumpable"](-1) == 1 then
						feedkey("<Plug>(vsnip-jump-prev)", "")
					end
				end, { "i", "s" }),
			},
			sources = {
				{ name = "nvim_lsp", keyword_length = 3 },
				{ name = "nvim_lua", keyword_length = 3 },
				{ name = "path" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "vsnip" },
			},
			preselect = cmp.PreselectMode.Item,
		})
	end,
}
