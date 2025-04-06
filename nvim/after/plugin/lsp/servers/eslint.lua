local shared = dofile(vim.fn.stdpath("config").."/after/plugin/lsp/init.lua")

return {
  on_attach = shared.on_attach_disable_native_format,
  handlers = shared.handlerWithoutHints
}
