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
      opts.extensions.fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
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
    config = function()
      vim.opt.fillchars:append { diff = "╱" }
      require("diffview").setup {}
      vim.api.nvim_set_hl(0, "DiffviewDiffChange", { bg = "#34323B", fg = "#FAE3B0" })
      vim.api.nvim_set_hl(0, "DiffviewDiffText", { bg = "#2B3D50", fg = "#89B4FA" })
    end,
  },

  {
    "FabijanZulj/blame.nvim",
    cmd = { "ToggleBlame", "EnableBlame", "DisableBlame" },
    opts = {
      date_format = "%Y-%m-%d",
    },
  },

  {
    "nguyenvukhang/nvim-toggler",
    opts = function(_, opts) opts.remove_default_keybindings = true end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
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
    config = true,
  },

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
      auto_manage_context = false,
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
  { "axkirillov/hbac.nvim", config = true },
}
