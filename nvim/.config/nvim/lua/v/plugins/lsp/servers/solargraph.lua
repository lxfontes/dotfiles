local _ = {}

_.setup = function(on_attach, capabilities)
  require('lspconfig').solargraph.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

return _
