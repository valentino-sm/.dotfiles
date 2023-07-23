return {
  "AstroNvim/astrocommunity",

  -- THEMES
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.dracula-nvim" },

  -- PACKS
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },

  -- PLUGINS LOGIC
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.utility.nvim-toggler" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },

  -- PLUGINS VIEW
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  {
    "diffview.nvim",
    cmd = "DiffviewOpen",
    opts = {
      view = {
        default = {
          winbar_info = true,
        },
        file_history = {
          winbar_info = true,
        },
      },
    },
  },
  {
    "neoscroll.nvim",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = "quadratic", -- Default easing function
      pre_hook = nil, -- Function to run before the scrolling animation starts
      post_hook = nil, -- Function to run after the scrolling animation ends
      performance_mode = false, -- Disable "Performance Mode" on all buffers.
    },
  },

  { import = "astrocommunity.scrolling.nvim-scrollbar" },
  {
    "nvim-scrollbar",
    opts = {
      handle = {
        blend = 80,
        color = "#DDAACC",
      },
      handlers = {
        gitsigns = true,
      },
    },
  },
}
