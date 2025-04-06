local shared = dofile(vim.fn.stdpath("config").."/after/plugin/lsp/init.lua")

return {
  handlers = shared.handlerWithoutHints
}

