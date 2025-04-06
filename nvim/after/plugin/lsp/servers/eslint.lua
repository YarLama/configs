local shared = require("init")

return {
  on_attach = shared.on_attach_disable_native_format,
  handlers = shared.handlerWithoutHints
}
