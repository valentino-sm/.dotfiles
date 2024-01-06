return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.completion.completeopt = "menu,menuone,noinsert"
      opts.completion.autocomplete = false
      opts.mapping["<M-CR>"] = opts.mapping["<CR>"]
      opts.mapping["<CR>"] = nil
    end,
  },

  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      table.insert(opts.extensions_list, "fzf")
      opts.extensions = opts.extensions or {}
      table.insert(opts.extensions, {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      })
    end,
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

  {
    "nguyenvukhang/nvim-toggler",
    event = { "BufWritePost", "InsertEnter" },
    keys = { "<leader>i" },
    -- keys = { { "<leader>i", desc = "Toggle" } },
    opts = function(_, opts) opts.remove_default_keybindings = true end,
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
    -- "andreadev-it/shade.nvim",
    -- dir = "/root/ghq/github.com/andreadev-it/Shade.nvim",
    "valentino-sm/shade.nvim",
    lazy = false,
    opts = {
      exclude_filetypes = { "NvimTree", "nvdash" },
    },
  },
}