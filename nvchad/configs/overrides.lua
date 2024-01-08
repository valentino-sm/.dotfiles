local M = {}

M.treesitter = {
  ensure_installed = {
    "json",
    "yaml",
    "toml",
    "bash",
    "python",
    "go",
    "requirements",
    "vimdoc",
    "dockerfile",
    "gitignore",
    "gitattributes",
    "gitcommit",
    "git_rebase",
    "git_config",
    "make",

    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- bash stuff
    "beautysh",

    -- python stuff
    "black",
    "isort",
    -- "mypy",
    "pyright",
    "ruff-lsp",

    -- go
    -- "gopls",
    -- "golangci-lint",

    -- docker stuff
    "dockerfile-language-server",
    "docker-compose-language-service",
    "hadolint",

    -- yaml
    "yaml-language-server",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    "typescript-language-server",
    -- "deno",
    "prettier",

    -- c/cpp stuff
    -- "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  on_attach = function(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Default mappings. Feel free to modify or remove as you wish.
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
    vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  end,
}

return M
