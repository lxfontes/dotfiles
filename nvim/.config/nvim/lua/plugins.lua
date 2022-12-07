--[[ git clone \
    --depth 1 \
    https://github.com/wbthomason/packer.nvim \
    "$HOME"/.local/share/nvim/site/pack/packer/start/packer.nvim
--]]

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'

	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}

	use {                                              -- filesystem navigation
	'kyazdani42/nvim-tree.lua',
	requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
	}

	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
	}

	use {
		'w0rp/ale',
		ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'go', 'cmake', 'html', 'markdown', 'vim', 'tex', 'ruby'},
		cmd = 'ALEEnable',
		config = 'vim.cmd[[ALEEnable]]'
	}
end)
