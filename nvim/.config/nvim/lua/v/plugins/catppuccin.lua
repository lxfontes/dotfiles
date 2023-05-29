return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      transparent_background = false,
      show_end_of_buffer = false,
      integrations = {
        which_key = true,
        telescope = true,
        gitsigns = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = {},
            hints = {},
            warnings = {},
            information = {},
          },
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
      },
    }

    vim.api.nvim_command 'colorscheme catppuccin'
  end,
}
