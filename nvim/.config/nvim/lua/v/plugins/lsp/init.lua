return {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  dependencies = {
    'jose-elias-alvarez/typescript.nvim',
    'folke/neodev.nvim',
    {
      'jose-elias-alvarez/null-ls.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
    },
    'b0o/schemastore.nvim',
    'SmiteshP/nvim-navic',
  },
  config = function()
    local _wk, wk = pcall(require, 'which-key')
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        require('nvim-navic').attach(client, bufnr)
      end

      if _wk then
        wk.register({
          ['<leader>l'] = {
            name = 'LSP',
            [']'] = { vim.diagnostic.goto_next, '[LSP] Next Diagnostic' },
            ['['] = { vim.diagnostic.goto_prev, '[LSP] Previous Diagnostic' },
          },
        }, {
          mode = 'n',
          prefix = '',
          silent = true,
          noremap = true,
          nowait = true,
        })
        wk.register({
          ['gD'] = { vim.lsp.buf.declaration, '[LSP] Goto Declaration' },
          ['gd'] = { vim.lsp.buf.definition, '[LSP] Goto Definition' },
          ['K'] = { vim.lsp.buf.hover, '[LSP] Hover' },
          ['gi'] = { vim.lsp.buf.implementation, '[LSP] Goto Implementation' },
          ['gr'] = { vim.lsp.buf.references, '[LSP] References' },
          ['<F2>'] = { vim.lsp.buf.rename, '[LSP] Rename' },
          ['<leader>l'] = {
            ['s'] = { vim.lsp.buf.signature_help, '[LSP] Signature Help' },
            ['D'] = { vim.lsp.buf.type_definition, '[LSP] Show Type Definition' },
            ['r'] = { vim.lsp.buf.rename, '[LSP] Rename' },
            ['c'] = { vim.lsp.buf.code_action, '[LSP] Open Code Actions Menu' },
            ['f'] = {
              function()
                vim.lsp.buf.format { async = true, timeout = 5000 }
              end,
              '[LSP] Format',
            },
          },
        }, {
          buffer = bufnr,
          mode = 'n',
          prefix = '',
          silent = true,
          noremap = true,
          nowait = true,
        })
      end

      if client.supports_method 'textDocument/formatting' then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd('BufWritePost', {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { timeout = 2000, bufnr = bufnr }
          end,
        })
      end
    end

    local _cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    local capabilities = _cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local servers = {
      'bashls',
      'cssls',
      'html',
      'emmet_ls',
      'jsonls',
      'yamlls',
      'dockerls',
      'lua_ls',
      'tsserver',
      'eslint',
      'cssmodules_ls',
      'rust_analyzer',
      'taplo',
      'solargraph',
      'rome',
      'gopls',
      'denols',
      'graphql',
      'null_ls',
    }
    for _, server in ipairs(servers) do
      require('v.plugins.lsp.servers.' .. server).setup(on_attach, capabilities)
    end

    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError', numhl = '' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn', numhl = '' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint', numhl = '' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo', numhl = '' })

    vim.diagnostic.config {
      virtual_text = {
        source = 'always',
        prefix = '▎',
        spacing = 6,
      },
      float = {
        source = 'always',
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    }
  end,
}
