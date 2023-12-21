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
        config = function()
          require "custom.configs.null-ls"
        end,
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

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
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

  {
    "Exafunction/codeium.vim",
    -- cmd = "Codeium",
    -- init = function()
    --   vim.g.codeium_enabled = 1
    --   -- vim.g.codeium_disable_bindings = 1
    --   -- vim.g.codeium_idle_delay = 1500
    --   -- match function
    -- end,
    lazy = false,
    config = function()
      vim.keymap.set("i", "<C-s>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<M-]>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<M-[>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
      -- vim.api.nvim_set_hl(0, "CodeiumSuggestion", { link = "Comment" })
      -- vim.keymap.set("n", "<leader>;", function()
      --   if vim.g.codeium_enabled == true then
      --     vim.cmd "CodeiumDisable"
      --   else
      --     vim.cmd "CodeiumEnable"
      --   end
      -- end, { noremap = true, desc = "Toggle Codeium active" })
    end,
  },
}

return plugins
