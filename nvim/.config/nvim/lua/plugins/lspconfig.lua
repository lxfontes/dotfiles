return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- keys[#keys + 1] = { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" }
  end,
}
