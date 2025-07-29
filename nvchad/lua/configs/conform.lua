local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    -- python = { "isort", "black" },
    python = { "isort", "black", "ruff_format" },
    -- python = { "isort", "black", "ruff_format", "ruff_fix" },
  },

  default_format_opts = {
    timeout_ms = 5000,
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
