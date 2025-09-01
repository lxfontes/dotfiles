local opt = vim.opt
local o = vim.o
local g = vim.g

g.toggle_theme_icon = "   "
o.winbar = "%=%m %f"
opt.shortmess:append("sI")
opt.relativenumber = false

vim.g.lazyvim_rust_diagnostics = "bacon-ls"
