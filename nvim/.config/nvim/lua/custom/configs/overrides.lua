local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "go",
    "bash"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "gopls",
    "eslint-lsp",
    "solargraph",

    "yaml-language-server",
    "omnisharp",
    "pyright",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.copilot = {
  suggestion = {
    enable = false
  },
  panel = {
    enable = false
  }
}

M.gitblame = {
  delay = 5000,
  message_template = '<summary> • <date> • <committer> • <sha>',
  schedule_event = 'CursorHold',
  clear_event = 'CursorMovedI',
  date_format = '%r'
}

return M
