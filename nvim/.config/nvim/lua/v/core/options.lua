vim.api.nvim_set_var('mapleader', ' ')

vim.opt.termguicolors = true
vim.opt.fileencoding = 'utf-8'
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.confirm = true
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.timeoutlen = 300
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.cmdheight = 0
vim.opt.undodir = '/tmp/nvim-undo'
vim.opt.undofile = true
vim.opt.pumheight = 10
vim.opt.laststatus = 3
vim.opt.updatetime = 200
vim.opt.shortmess:append 'c'
vim.opt.background = 'dark'
vim.opt.fillchars = 'fold: ,vert:│,eob: ,msgsep:‾'
vim.opt.hidden = true

vim.filetype.add {
  pattern = {
    ['[jt]sconfig.*.json'] = 'jsonc',
  },
}
