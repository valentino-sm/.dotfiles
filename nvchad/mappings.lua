---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-q>"] = { "<cmd>qa!<cr>", "Force quit" },
  },
  v = {
    -- [">"] = { ">gv", "indent"},
  },
}

M.tabufline = {
  n = {
    -- cycle through buffers
    ["]b"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["[b"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    -- ["<leader>x"] = {
    --   function()
    --     require("nvchad.tabufline").close_buffer()
    --   end,
    --   "Close buffer",
    -- },
  },
}

M.nvimtree = {
  n = {
    -- toggle
    -- ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>o"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.telescope = {
  n = {
    -- pick a hidden term
    ["<leader>fs"] = { "<cmd> Telescope keymaps <CR>", "Find keymaps" },
  },
}

-- more keybinds!

return M
