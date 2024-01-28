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
    "FabijanZulj/blame.nvim",
    cmd = { "ToggleBlame", "EnableBlame", "DisableBlame" },
    opts = {
      date_format = "%Y-%m-%d",
    }
  },

  {
    "nguyenvukhang/nvim-toggler",
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

  -- Highlight letter when find
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
    config = true,
  },

  -- {
  --   -- "andreadev-it/shade.nvim",
  --   -- dir = "/root/ghq/github.com/andreadev-it/Shade.nvim",
  --   "valentino-sm/shade.nvim",
  --   lazy = false,
  --   opts = {
  --     overlay_opacity = 70,
  --     exclude_filetypes = { "NvimTree", "nvdash" },
  --   },
  -- },

  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    opts = {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = false,
    },
  },

  {
    "valentino-sm/aider.nvim",
    opts = {
      default_bindings = false,
      ignore_buffers = {
        "^term://",
        "NvimTree_",
        "neo-tree filesystem",
        "NeogitConsole",
        ".md",
        ".yaml",
        ".yml",
        ".toml",
        ".json",
        ".lock",
      },
    },
  },
  { "valentino-sm/nvim-lspimport" },
  -- Heuristic buffer auto-close
  { "axkirillov/hbac.nvim",                     config = true },
}
