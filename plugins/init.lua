return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    -- Show func comment with K key
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
    },
    dependencies = {
      {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
  -- {
  --   -- Inlay Hints: Auto Comments with Types
  --   "lvimuser/lsp-inlayhints.nvim", config = true
  -- },
  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   event = "BufRead",
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   opts = {
  --     check_ts = true,
  --     ts_config = { java = false },
  --     fast_wrap = {
  --       map = "<M-e>",
  --       chars = { "{", "[", "(", '"', "'" },
  --       pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
  --       offset = 0,
  --       end_key = "$",
  --       keys = "qwertyuiopzxcvbnmasdfghjkl",
  --       check_comma = true,
  --       highlight = "PmenuSel",
  --       highlight_grey = "LineNr",
  --     },
  --   },
  -- },
}
