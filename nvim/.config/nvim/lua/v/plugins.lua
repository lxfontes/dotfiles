local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}

table.insert(plugins, 'tpope/vim-fugitive')     -- git
table.insert(plugins, 'tpope/vim-rhubarb')      -- git
table.insert(plugins, 'tpope/vim-sleuth')       -- detect sw & ts
table.insert(plugins, 'nvim-tree/nvim-web-devicons')
table.insert(plugins, 'stevearc/overseer.nvim') -- bg tasks
table.insert(plugins, {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
  dependencies = { 'nvim-lua/plenary.nvim' },
})

table.insert(plugins, {
  'jose-elias-alvarez/null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'mason.nvim' },
  opts = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion
    return {
      sources = {
        code_actions.eslint,
        code_actions.gitsigns,
        code_actions.refactoring,
        code_actions.shellcheck,

        completion.spell,

        diagnostics.alex,
        diagnostics.eslint,
        diagnostics.flake8,
        diagnostics.golangci_lint,
        diagnostics.jsonlint,
        diagnostics.proselint,
        diagnostics.reek,
        diagnostics.rubocop,
        diagnostics.tsc,
        diagnostics.yamllint,

        formatting.shfmt.with {
          filetypes = { 'sh', 'bash', 'zsh' },
        },
        formatting.gofumpt,
        formatting.nginx_beautifier,
        formatting.eslint,
        formatting.fish_indent,
        formatting.prettierd,
        formatting.rubocop,
        formatting.stylua,
      },
    }
  end,
})

table.insert(plugins, {
  'kylechui/nvim-surround',
  event = 'BufReadPost',
  config = true,
})

-- comment toggle
table.insert(plugins, {
  'numToStr/Comment.nvim',
  event = 'BufReadPost',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  opts = function()
    return {
      padding = true,
      sticky = true,
      mappings = {
        basic = true,
        extra = true,
      },
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
})

table.insert(plugins, {
  'neovim/nvim-lspconfig',
  dependencies = {
    'SmiteshP/nvim-navic',
    'folke/which-key.nvim',
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim',       opts = { event = 'VimEnter' } },

    {
      'jose-elias-alvarez/null-ls.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
    },
  },
})
table.insert(plugins, {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require 'cmp'
    cmp.setup {
      enabled = true,
      completion = {
        completeopt = 'longest,menuone',
      },
      preselect = cmp.PreselectMode.Item,
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      }),
    }
  end,
})

table.insert(plugins, {
  'zbirenbaum/copilot.lua',
  event = 'BufReadPost',
  opts = {
    panel = {
      enabled = true,
      auto_refresh = true,
      keymap = {
        jump_prev = '[[',
        jump_next = ']]',
        accept = '<CR>',
        refresh = 'gr',
        open = '<M-CR>',
      },
      layout = {
        position = 'bottom', -- | top | left | right
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = '<M-l>',
        accept_word = false,
        accept_line = false,
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-]>',
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ['.'] = false,
    },
  },
})

-- Adds git releated signs to the gutter, as well as utilities for managing changes
table.insert(plugins, {
  'lewis6991/gitsigns.nvim',
  opts = {
    signcolumn = true,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 5000,
    },
    current_line_blame_formatter_opts = {
      relative_time = false,
    },
    signs = {
      add = { hl = 'GitSignsAdd', text = '▍', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change = {
        hl = 'GitSignsChange',
        text = '▍',
        numhl = 'GitSignsChangeNr',
        linehl = 'GitSignsChangeLn',
      },
      delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      topdelete = {
        hl = 'GitSignsDelete',
        text = '‾',
        numhl = 'GitSignsDeleteNr',
        linehl = 'GitSignsDeleteLn',
      },
      changedelete = {
        hl = 'GitSignsChange',
        text = '~',
        numhl = 'GitSignsChangeNr',
        linehl = 'GitSignsChangeLn',
      },
      untracked = { hl = 'GitSignsAdd', text = ' ', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    },
  },
})

table.insert(plugins, {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
})

table.insert(plugins, {
  'folke/tokyonight.nvim',
  opts = { style = 'moon' },
  config = function()
    vim.cmd.colorscheme 'tokyonight'
  end,
})

table.insert(plugins, {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'neovim/nvim-lspconfig',
  },
  opts = {
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
            added = 'DiffAdd',                                      -- Changes the diff's added color
            modified = 'DiffChange',                                -- Changes the diff's modified color
            removed = 'DiffDelete',                                 -- Changes the diff's removed color you
          },
          symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
          source = nil,                                             -- A function that works as a data source for diff.
          -- It must return a table as such:
          --   { added = add_count, modified = modified_count, removed = removed_count }
          -- or nil on failure. count <= 0 won't be displayed.
        },
      },
      lualine_c = { 'diagnostics' },
      lualine_x = {
        {},
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
      lualine_z = {},
    },
    extensions = { 'quickfix', 'nvim-tree', 'fzf', 'lazy', 'overseer' },
    winbar = {},
  },
})

table.insert(plugins, {
  'iamcco/markdown-preview.nvim',
  build = 'cd app && npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
})

table.insert(plugins, {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  opts = {
    char = '┊',
    show_trailing_blankline_indent = false,
    use_treesitter = true,
  },
})

table.insert(plugins, { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } })

-- install fzf
table.insert(plugins, {
  'nvim-telescope/telescope-fzf-native.nvim',
  -- NOTE: If you are having trouble with this installation,
  --       refer to the README for telescope-fzf-native for more instructions.
  build = 'make',
  cond = function()
    return vim.fn.executable 'make' == 1
  end,
})

table.insert(plugins, {
  'nvim-tree/nvim-tree.lua',
  opts = {
    sort_by = 'case_sensitive',
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  },
})

table.insert(plugins, {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = { enable = false },
      lightbulb = {
        enable = false,
      },
    })
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
})

table.insert(plugins, {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require 'which-key'

    wk.register({
      ['<leader>n'] = {
        name = 'NVIMTREE',
        ['n'] = { '<CMD>NvimTreeToggle<CR>', '[NVIMTREE] Toggle' },
        ['r'] = { '<CMD>NvimTreeRefresh<CR>', '[NVIMTREE] Refresh' },
        ['c'] = { '<CMD>NvimTreeCollapse<CR>', '[NVIMTREE] Collapse' },
      },
      ['<C-0>'] = { '<CMD>Lspsaga outline<CR>', '[LSP] Toggle Outline' },
      ['<C-_>'] = { '<CMD>NvimTreeToggle<CR>', '[NVIMTREE] Toggle' },

      ['<leader>f'] = {
        name = 'TELESCOPE',
        ['f'] = { '<CMD>Telescope find_files hidden=true no_ignore=true<CR>', '[TELESCOPE] Find File' },
        ['g'] = { '<CMD>Telescope live_grep<CR>', '[TELESCOPE] Find File by grep' },
        ['b'] = { '<CMD>Telescope buffers<CR>', '[TELESCOPE] Find buffers' },
        ['d'] = { '<CMD>Telescope diagnostics<CR>', '[TELESCOPE] Diagnostics' },
      },
      ['<C-p>'] = { '<CMD>Telescope find_files hidden=true<CR>', '[TELESCOPE] Find file' },
      ['<C-s-p>'] = { '<CMD>Telescope live_grep<CR>', '[TELESCOPE] Live Grep' },

      ['<leader>v'] = { '<CMD>vsplit<CR><C-w><C-w>', 'Split Vertical' },
      ['<leader>s'] = { '<CMD>split<CR><C-w><C-w>', 'Split Horizontal' },
      ['<leader>h'] = { '<CMD>WhichKey<CR>', 'Split Horizontal' },

      ['<leader>g'] = {
        name = 'GIT',
        ['s'] = { '<CMD>Gitsigns toggle_signs<CR>', '[GIT] Toggle signs' },
        ['h'] = { '<CMD>Gitsigns preview_hunk<CR>', '[GIT] Preview hunk' },
        ['d'] = { '<CMD>Gitsigns diffthis<CR>', '[GIT] Diff' },
        ['n'] = { '<CMD>Gitsigns next_hunk<CR>', '[GIT] Next hunk' },
        ['p'] = { '<CMD>Gitsigns prev_hunk<CR>', '[GIT] Prev hunk' },
        ['f'] = { '<CMD>Telescope git_status<CR>', '[GIT] Files Status' },
        ['c'] = { '<CMD>Telescope git_commits<CR>', '[GIT] Commits' },
        ['b'] = { '<CMD>Telescope git_branches<CR>', '[GIT] Branches' },
      },
    }, {
      mode = 'n',
      prefix = '',
      silent = true,
      noremap = true,
      nowait = true,
    })

    wk.setup {
      icons = {
        breadcrumb = '',
        separator = '',
        group = ' ',
      },
      key_labels = {
        ['<space>'] = 'SPACE',
        ['<leader>'] = 'SPACE',
        ['<cr>'] = 'RETURN',
        ['<tab>'] = 'TAB',
      },
    }
  end,
})

require('lazy').setup(plugins, {
  install = {
    missing = true,
    colorscheme = { 'tokyonight' },
  },
  performance = {
    cache = {
      enabled = true,
      disable_events = { 'VimEnter', 'BufReadPre' },
    },
  },
})

-- telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

require('telescope').load_extension 'fzf'

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'javascript', 'bash', 'vimdoc',
    'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = true,

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end

  local wk = require 'which-key'

  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', '<CMD>Lspsaga rename<CR>', '[R]e[n]ame')
  nmap('<leader>ca', '<CMD>Lspsaga code_action<CR>', '[C]ode [A]ction')
  nmap('<C-[>', '<CMD>Lspsaga diagnostic_jump_prev<CR>', 'Diagnostics Jump Previous')
  nmap('<C-]>', '<CMD>Lspsaga diagnostic_jump_next<CR>', 'Diagnostics Jump Next')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format({timeout_ms = 5000})
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  bashls = {
    cmd_env = {
      GLOB_PATTERN = '*@(.sh|.inc|.bash|.command|.zsh)',
    },
    filetypes = { 'sh', 'zsh' },
  },
  cssls = {},
  html = {},
  jsonls = {},
  yamlls = {},
  dockerls = {},
  pyright = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  tsserver = {},
  eslint = {
    root_dir = require('lspconfig').util.root_pattern('.eslintrc', '.eslintrc.js', '.eslintrc.json'),
    settings = {
      format = {
        enable = false,
      },
    },
  },
  rust_analyzer = {},
  cssmodules_ls = {
    filetypes = { 'javascriptreact', 'typescriptreact' },
  },
  taplo = {},
  solargraph = {},
  rome = {
    root_dir = require('lspconfig').util.root_pattern 'rome.json',
    single_file_support = false,
  },
  gopls = {},
  denols = {
    root_dir = require('lspconfig').util.root_pattern('deno.json', 'deno.jsonc'),
  },
  graphql = {},
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local merge = function(a, b)
      local c = {}
      for k, v in pairs(a) do
        c[k] = v
      end
      for k, v in pairs(b) do
        c[k] = v
      end
      return c
    end
    require('lspconfig')[server_name].setup(merge({ capabilities = capabilities, on_attach = on_attach },
      servers[server_name]))
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
