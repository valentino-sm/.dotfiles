local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

vim.lsp.config("*", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.enable {
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
