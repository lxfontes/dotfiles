vim.api.nvim_set_var('mapleader', ' ')

vim.opt.termguicolors = true
vim.opt.fileencoding = 'utf-8'
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.foldenable = false
vim.opt.confirm = true
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = 'yes:2'
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
vim.opt.pumblend = 10
vim.opt.ruler = true
vim.opt.laststatus = 3
vim.opt.updatetime = 200
vim.opt.shortmess:append 'c'
vim.opt.background = 'dark'
vim.opt.hidden = true
vim.opt.colorcolumn = '+1'
vim.opt.list = true

vim.opt.matchpairs = { '(:)', '{:}', '[:]', '<:>' }

vim.opt.listchars = {
  conceal = '┊',
  eol = ' ', -- ↲
  extends = '>',
  nbsp = '␣',
  precedes = '<',
  space = ' ',
  tab = '» ',
  trail = '•',
}

vim.opt.fillchars = {
  eob = ' ',
  fold = ' ',
  stl = ' ',
  stlnc = ' ',
}

-- extensions not required for opening files with gf
vim.opt.suffixesadd = {
  '.js',
  '.ts',
  '.jsx',
  '.tsx',
  '.lua',
  '.py',
}

vim.opt.wildignore = {
  '**/node_modules/**',
  '**/__pycache__/**,',
  '**/.git/**,',
  '**/.vscode/**,',
  '**/.idea/**,',
  '*.o',
  '*.obj',
  '*.dll',
  '*.jar',
  '*.pyc',
  '*.gif',
  '*.ico',
  '*.jpg',
  '*.jpeg',
  '*.png',
  '*.pdf',
  '*.avi',
  '*.wav',
  '*.*~',
  '*~ ',
  '*.swp',
  '.lock',
  '.DS_Store',
  'tags.lock',
  'tags',
}

vim.opt.diffopt = {
  'closeoff', -- cancel diff if only one window is remaining
  'context:6', -- context of 6 lines to changes
  'filler', -- show filler lines to keep text synchronized
  'hiddenoff', -- cancel diff for hidden buffers
  'indent-heuristic',
  'internal',
  'iwhite', -- ignore trailing whitespaces
  'vertical', -- use vertical split by default
}

vim.filetype.add {
  pattern = {
    ['[jt]sconfig.*.json'] = 'jsonc',
  },
}
