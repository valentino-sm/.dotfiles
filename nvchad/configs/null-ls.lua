local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
  -- bash
  b.formatting.beautysh.with { filetypes = { "sh", "zsh", "bash", "fish" } },

  -- python
  b.formatting.black.with { filetypes = { "python" } },
  b.formatting.isort.with { filetypes = { "python" } },
  -- b.diagnostics.ruff.with { filetypes = { "python" } },
  -- b.diagnostics.mypy.with { filetypes = { "python" } },

  -- docker
  b.diagnostics.hadolint.with { filetypes = { "dockerfile" } },

  -- webdev stuff
  b.formatting.deno_fmt.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } }, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "yaml", "html", "markdown", "css" } },                                -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua.with { filetypes = { "lua" } },

  -- cpp
  b.formatting.clang_format.with { filetypes = { "cpp", "c" } },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
