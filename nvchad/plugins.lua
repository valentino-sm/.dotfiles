local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require "custom.configs.null-ls" end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  -- custom treesitter stuff
  require "custom.configs.treesitter",

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function() require("better_escape").setup() end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.completion.completeopt = "menu,menuone,noinsert"
      opts.completion.autocomplete = false
      opts.mapping["<M-CR>"] = opts.mapping["<CR>"]
      opts.mapping["<CR>"] = nil
    end,
  },

  require "custom.configs.codeium",

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts) table.insert(opts.extensions_list, "fzf") end,
  },

  {
    "Shatur/neovim-session-manager",
    event = "BufWritePost",
    cmd = "SessionManager",
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig" },
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },

  require "custom.configs.rainbow-delimiters",
  require "custom.configs.neoscroll",

  {
    "nguyenvukhang/nvim-toggler",
    event = { "BufWritePost", "InsertEnter" },
    keys = { { "<leader>i", desc = "Toggle" } },
    opts = function(_, opts)
      opts.remove_default_keybindings = true
      vim.keymap.set({ "n", "v" }, "<leader>i", require("nvim-toggler").toggle)
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function() require("nvim-surround").setup {} end,
  },

  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPre",
    opts = function(_, opts)
      opts.max_lines = 10000
      opts.handle = {
        blend = 90,
        color = "#DDAACC",
      }
      opts.handlers = {
        gitsigns = true,
      }
    end,
  },

  {
    "jinh0/eyeliner.nvim",
    event = "BufReadPre",
    opts = {
      highlight_on_key = true,
      dim = false,
    },
  },

  {
    "RubixDev/mason-update-all",
    cmd = "MasonUpdateAll",
    opts = {},
  },

  {
    "andreadev-it/shade.nvim",
    lazy = false,
    opts = {
      exclude_filetypes = { "NvimTree" },
    }
  },
}

return plugins
