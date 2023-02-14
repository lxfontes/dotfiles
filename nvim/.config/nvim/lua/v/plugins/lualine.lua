return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
  },
  config = function()
    local navic = require('nvim-navic')
    require('lualine').setup {
      options = { globalstatus = true },
      sections = {
        lualine_a = { 'branch' },
        lualine_b = { 'diff' },
        lualine_c = { 'diagnostics' },
        lualine_x = {
                    { navic.get_location, cond = navic.is_available }

                },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    }
  end,
}
