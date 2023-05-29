return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'neovim/nvim-lspconfig',
    'SmiteshP/nvim-navic',
  },
  config = function()
    local navic = require 'nvim-navic'
    require('lualine').setup {
      options = {
        globalstatus = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
      theme = 'auto',
      sections = {
        lualine_a = { 'branch' },
        lualine_b = {
          {
            'diff',
            colored = true, -- Displays a colored diff status if set to true
            diff_color = {
              -- Same color values as the general color option can be used here.
              added = 'DiffAdd', -- Changes the diff's added color
              modified = 'DiffChange', -- Changes the diff's modified color
              removed = 'DiffDelete', -- Changes the diff's removed color you
            },
            symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
            source = nil, -- A function that works as a data source for diff.
            -- It must return a table as such:
            --   { added = add_count, modified = modified_count, removed = removed_count }
            -- or nil on failure. count <= 0 won't be displayed.
          },
        },
        lualine_c = { 'diagnostics' },
        lualine_x = {
          { navic.get_location, cond = navic.is_available },
        },
        lualine_y = {},
        lualine_z = {
          {
            'searchcount',
            maxcount = 999,
            timeout = 500,
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = { 'buffers' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'filename' },
      },
      extensions = { 'quickfix', 'nvim-tree', 'fzf', 'lazy', 'overseer' },
      winbar = {},
    }
  end,
}
