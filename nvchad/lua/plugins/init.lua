local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "folke/which-key.nvim",
    lazy = false,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "standardpointer/void-ls.nvim",
        config = function() require "configs.null-ls" end,
      },
    },
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
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

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  -- load luasnips + cmp related in insert mode only
}

return plugins
