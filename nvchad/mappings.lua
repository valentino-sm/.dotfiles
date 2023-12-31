---@type MappingsTable
local M = {}

local sections = {
  f = "Find",
  p = "Packages",
  l = "LSP",
  u = "UI/UX",
  b = "Buffers",
  bs = "Sort Buffers",
  d = "Debugger",
  g = "Git",
  S = "Session",
  t = "Terminal",
}

M.disabled = {
  n = {
    ["<leader>b"] = "",
  },
}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd>confirm q<cr>", "Quit" },
    ["<leader>Q"] = { "<cmd>confirm qall<cr>", "Quit all" },
    ["<C-q>"] = { "<cmd>qa!<cr>", "Force quit" },
    ["<leader>n"] = { "<cmd>enew<cr>", "New File" },
    ["|"] = { "<cmd>vsplit<cr>", "Vertical Split" },
    ["\\"] = { "<cmd>split<cr>", "Horizontal Split" },
  },
  v = {
    -- [">"] = { ">gv", "indent"},
  },
}

M.tabufline = {
  n = {
    ["]b"] = { function() require("nvchad.tabufline").tabuflineNext() end, "Goto next buffer" },
    ["[b"] = { function() require("nvchad.tabufline").tabuflinePrev() end, "Goto prev buffer" },
    [">b"] = { function() require("nvchad.tabufline").move_buf(1) end, "Move buffer next" },
    ["<b"] = { function() require("nvchad.tabufline").move_buf(-1) end, "Move buffer prev" },

    ["<leader>bc"] = { function() require("nvchad.tabufline").closeAllBufs() end, "Close all buffers" },

    ["<leader>bn"] = { "<cmd>tabnew<cr>", "New tab" },
    ["]t"] = { function() vim.cmd.tabnext() end, "Next tab" },
    ["[t"] = { function() vim.cmd.tabprevious() end, "Previous tab" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>o"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.telescope = {
  n = {
    ["<leader>fs"] = { "<cmd> Telescope keymaps <CR>", "Find keymaps" },
  },
}

M.ui = {
  n = {
    ["<leader>un"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>ur"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
    ["<leader>ut"] = { "<cmd> set list! <CR>", "Toggle invisible chars" },
  },
}

M.packages = {
  n = {
    ["<leader>pi"] = { function() require("lazy").install() end, "Plugins Install" },
    ["<leader>ps"] = { function() require("lazy").home() end, "Plugins Status" },
    ["<leader>pS"] = { function() require("lazy").sync() end, "Plugins Sync" },
    ["<leader>pu"] = { function() require("lazy").check() end, "Plugins Check Updates" },
    ["<leader>pU"] = { function() require("lazy").update() end, "Plugins Update" },

    ["<leader>pa"] = { "<cmd> NvChadUpdate <cr>", "Update NvChad" },
  },
}

M.sessions = {
  n = {
    ["<leader>Sl"] = { "<cmd>SessionManager! load_last_session<cr>", "Load last session" },
    ["<leader>Ss"] = { "<cmd>SessionManager! save_current_session<cr>", "Save this session" },
    ["<leader>Sd"] = { "<cmd>SessionManager! delete_session<cr>", "Delete session" },
    ["<leader>Sf"] = { "<cmd>SessionManager! load_session<cr>", "Search sessions" },
    ["<leader>S."] = { "<cmd>SessionManager! load_current_dir_session<cr>", "Load current directory session" },
  },
}

M.git = {
  n = {
    ["<leader>gg"] = { "<cmd>LazyGit<cr>", "Open LazyGit" },
    ["<leader>gG"] = { "<cmd>LazyGitConfig<cr>", "Open LazyGitConfig" },

    ["<leader>gh"] = { "<cmd>DiffviewFileHistory<cr>", "Open DiffviewFileHistory" },
    ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", "Open Diffview" },
    ["<leader>gc"] = { "<cmd>DiffviewClose<cr>", "Close Diffview" },
  },
}

return M
