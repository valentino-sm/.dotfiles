local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  {
    "folke/which-key.nvim",
    lazy = false,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {
      mappings = {
        t = {
          j = {
            k = false,
          },
        },
        v = {
          j = {
            k = false,
            j = false,
          },
        },
      },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = {
        "*",
        "!lazy",
        css = { css = true },
        html = { css = true },
      },
      user_default_options = {
        names = false,
      },
    },
  },
}

return plugins
