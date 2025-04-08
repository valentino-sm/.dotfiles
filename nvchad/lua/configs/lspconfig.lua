local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  -- "lua_ls", # nvchad does this itself
  "gopls",
  "yamlls",
  "dockerls",
  "docker_compose_language_service",
  "pyright",
  "html",
  "cssls",
  "ts_ls",
  "clangd",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
