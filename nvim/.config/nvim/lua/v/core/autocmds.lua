local autocmd = vim.api.nvim_create_autocmd

local function set_indent_size(size)
  vim.api.nvim_buf_set_option(0, 'shiftwidth', size)
  vim.api.nvim_buf_set_option(0, 'tabstop', size)
  vim.api.nvim_buf_set_option(0, 'softtabstop', size)
end

autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
})

autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    vim.api.nvim_buf_set_option(0, 'formatoptions', (string.gsub(vim.api.nvim_buf_get_option(0, 'formatoptions'), '[jcro]', '')))
  end,
})

autocmd('VimResized', {
  pattern = '*',
  command = 'wincmd =',
  desc = 'Resize window when host window changes',
})

autocmd('FileType', {
  pattern = { 'lua', 'rust', 'go', 'gitconfig' },
  callback = function()
    set_indent_size(4)
  end,
})

autocmd('FileType', {
  pattern = 'make',
  callback = function()
    set_indent_size(4)
    vim.api.nvim_buf_set_option(0, 'expandtab', false)
  end,
})

autocmd('BufRead', {
  callback = function(opts)
    autocmd('BufWinEnter', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        if not (ft:match 'commit' and ft:match 'rebase') and last_known_line > 1 and last_known_line <= vim.api.nvim_buf_line_count(opts.buf) then
          vim.api.nvim_feedkeys([[g`"]], 'x', false)
        end
      end,
    })
  end,
})


-- enable cursor on active windows
local cursor_opts = {
  callback = function()
    vim.opt_local.cursorline = true
  end,
  group = read_group }
autocmd('VimEnter', cursor_opts)
autocmd('WinEnter', cursor_opts)
autocmd('BufWinEnter', cursor_opts)
autocmd('WinLeave', {
	callback = function()
    vim.opt_local.cursorline = false
	end,
	group = read_group })
