local shared = dofile(vim.fn.stdpath("config") .. "/after/plugin/lsp/init.lua")
local servers = {
  "lua_ls",
  "ts_ls",
  "eslint",
  "yamlls",
  "cssls",
  "tailwindcss",
}
local default_config = {
  on_attach = shared.on_attach,
  capabilities = shared.capabilities,
}

for _, server in ipairs(servers) do
  local ok, config = pcall(require, "lsp.servers." .. server)
  if (ok and type(config) == "table") then
    vim.lsp.config(server, vim.tbl_deep_extend("force", {
      on_attach = shared.on_attach,
      capabilities = shared.capabilities,
    }, config or {}))
  else
    vim.lsp.config(server, default_config)
  end
end
