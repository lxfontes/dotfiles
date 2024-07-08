return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.sections.lualine_a = { "branch" }
    opts.sections.lualine_b = {}
    opts.sections.lualine_z = {}
    opts.options.component_separators = ""
    opts.options.section_separators = ""
  end,
}
