require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del

-- map("i", "jk", "<ESC>")

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
  i = {
    ["<C-b>"] = { --[[  "<ESC>^i", "Beginning of line"  ]]
    },
  },
  n = {
    ["<leader>b"] = { --[[  "<cmd> enew <CR>", "New buffer"  ]]
    },
    ["<leader>ch"] = { --[[  "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet"  ]]
    },
    ["<leader>n"] = { --[[  "<cmd> set nu! <CR>", "Toggle line number"  ]]
    },
    ["<leader>rn"] = { --[[  "<cmd> set rnu! <CR>", "Toggle relative number"  ]]
    },

    -- gitsigns
    -- ["<leader>rh"] = { --[[  function() require("gitsigns").reset_hunk() end, "Reset hunk"  ]]
    -- },
    -- ["<leader>ph"] = { --[[  function() require("gitsigns").preview_hunk() end, "Preview hunk"  ]]
    -- },
    -- ["<leader>td"] = { --[[  function() require("gitsigns").toggle_deleted() end, "Toggle deleted"  ]]
    -- },

    -- telescope
    ["<leader>cm"] = { --[[  "<cmd> Telescope git_commits <CR>", "Git commits"  ]]
    },
    ["<leader>th"] = { --[[  "<cmd> Telescope themes <CR>", "Nvchad themes"  ]]
    },
    ["<leader>pt"] = { --[[  "<cmd> Telescope terms <CR>", "Pick hidden term"  ]]
    },
    ["<leader>ma"] = { --[[  "<cmd> Telescope marks <CR>", "telescope bookmarks"  ]]
    },

    -- lsp
    -- ["<leader>D"] = { --[[  function() vim.lsp.buf.type_definition() end, "LSP definition type"  ]]
    -- },
    -- ["<leader>ra"] = { --[[  function() require("nvchad.renamer").open() end, "LSP rename"  ]]
    -- },
    -- ["<leader>ca"] = { --[[  function() vim.lsp.buf.code_action() end, "LSP code action"  ]]
    -- },
    -- ["gr"] = { --[[  function() vim.lsp.buf.references() end, "LSP references"  ]]
    -- },

    -- nvterm
    ["<leader>h"] = { --[[  function() require("nvchad.term").new "horizontal" end, "New horizontal term"  ]]
    },
    ["<leader>v"] = { --[[  function() require("nvchad.term").new "vertical" end, "New vertical term"  ]]
    },

    -- blankline
    ["<leader>cc"] = { --[[  "Jump to current context"  ]]
    },
  },
  -- v = {
  --   ["<leader>ca"] = { --[[  function() vim.lsp.buf.code_action() end, "LSP code action"  ]]
  --   },
  -- },
}

-- Remove all keymaps
for mode, tbl in pairs(M.disabled) do
  for key, _ in pairs(tbl) do
    -- print(mode, key)
    pcall(del, mode, key)
    -- unmap(mode, key)
  end
end

M.disabled = {}

M.general = {
  i = {
    ["<C-a>"] = { "<ESC>^i", "Beginning of line" },
  },

  n = {
    ["<C-i>"] = { "<C-i>", "Remap <C-i>" },
    ["<C-c>"] = { "<cmd> noh <CR><cmd> %y+ <CR>", "Copy whole file" },

    ["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, "Move to left split" },
    ["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, "Move to below split" },
    ["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, "Move to above split" },
    ["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, "Move to right split" },
    ["<C-Up>"] = { function() require("smart-splits").resize_up() end, "Resize split up" },
    ["<C-Down>"] = { function() require("smart-splits").resize_down() end, "Resize split down" },
    ["<C-Left>"] = { function() require("smart-splits").resize_left() end, "Resize split left" },
    ["<C-Right>"] = { function() require("smart-splits").resize_right() end, "Resize split right" },

    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd>confirm q<cr>", "Quit" },
    ["<C-q>"] = { "<cmd>confirm qall<cr>", "Quit all" },
    -- ["<C-q>"] = { "<cmd>qa!<cr>", "Force quit" },
    ["<leader>n"] = { "<cmd>enew<cr>", "New File" },
    ["|"] = { "<cmd>vsplit<cr>", "Vertical Split" },
    ["\\"] = { "<cmd>split<cr>", "Horizontal Split" },

    ["<leader>i"] = { function() require("nvim-toggler").toggle() end, "Toggle word" },

    ["<leader>  "] = { function() require("aider").AiderOpen() end, "Open Aider" },
    ["<leader>lc"] = { function() require("aider").AiderOpen "-3" end, "Open Aider 3" },
    ["<leader> a"] = { function() require("aider").AiderOpen "-3" end, "Open Aider 3" },
    ["<leader> 3"] = {
      function() require("aider").AiderOpen "--model=gpt-3.5-turbo-0613" end,
      "Open Aider GPT-3-Turbo 0613",
    },
    ["<leader> 4"] = { function() require("aider").AiderOpen "--4turbo" end, "Open Aider GPT-4 Turbo" },
    ["<leader> f"] = { function() require("aider").AiderOpen "--model=gpt-4" end, "Open Aider GPT-4 Full" },
  },

  v = {
    [">"] = { ">", "Indent line" },
    ["<"] = { "<", "Indent line" },
    ["<Tab>"] = { ">gv", "Indent line" },
    ["<S-Tab>"] = { "<gv", "Indent line" },
    ["."] = { ":norm .<CR>", "Repeat last command" },
  },

  t = {
    ["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, "Move to left split" },
    ["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, "Move to below split" },
    ["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, "Move to above split" },
    ["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, "Move to right split" },
    ["<C-Up>"] = { function() require("smart-splits").resize_up() end, "Resize split up" },
    ["<C-Down>"] = { function() require("smart-splits").resize_down() end, "Resize split down" },
    ["<C-Left>"] = { function() require("smart-splits").resize_left() end, "Resize split left" },
    ["<C-Right>"] = { function() require("smart-splits").resize_right() end, "Resize split right" },
  },
}

M.tabufline = {
  n = {
    ["]b"] = { function() require("nvchad.tabufline").tabuflineNext() end, "Goto next buffer" },
    ["[b"] = { function() require("nvchad.tabufline").tabuflinePrev() end, "Goto prev buffer" },

    [">b"] = { function() require("nvchad.tabufline").move_buf(1) end, "Move buffer next" },
    ["<b"] = { function() require("nvchad.tabufline").move_buf(-1) end, "Move buffer prev" },
    ["<leader>b>"] = { function() require("nvchad.tabufline").move_buf(1) end, "Move buffer next" },
    ["<leader>b<"] = { function() require("nvchad.tabufline").move_buf(-1) end, "Move buffer prev" },

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
    ["<leader>f'"] = { "<cmd> Telescope marks <CR>", "Find marks" },
    ["<leader>f<CR>"] = { function() require("telescope.builtin").resume() end, "Resume previous search" },
    ["<leader>f/"] = {
      function() require("telescope.builtin").current_buffer_fuzzy_find() end,
      "Find words in current buffer",
    },
    ["<leader>fc"] = { function() require("telescope.builtin").grep_string() end, "Find word under cursor" },
    ["<leader>fC"] = { function() require("telescope.builtin").commands() end, "Find commands" },
    ["<leader>fk"] = { function() require("telescope.builtin").keymaps() end, "Find keymaps" },
    ["<leader>fM"] = { function() require("telescope.builtin").man_pages() end, "Find man" },
    ["<leader>fr"] = { function() require("telescope.builtin").registers() end, "Find registers" },
    ["<leader>fW"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args)
            local new_args = {}
            if args then
              new_args = vim.list_extend(new_args, args)
            end
            vim.list_extend(new_args, { "--hidden", "--no-ignore" })
            return new_args
          end,
        }
      end,
      "Live grep all files",
    },
  },
}

M.ui = {
  n = {
    ["<leader>un"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>ur"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },
    ["<leader>ut"] = { "<cmd> set list! <CR>", "Toggle invisible chars" },
    -- Toggle wrap
    ["<leader>uw"] = { "<cmd> set wrap! <CR>", "Toggle line wrap" },
  },
}

M.packages = {
  n = {
    ["<leader>pa"] = { "<cmd> NvChadUpdate <CR><cmd> MasonUpdateAll <CR>", "NvChad update" },
    ["<leader>pc"] = { "<cmd> NvCheatsheet <CR>", "NvChad cheatsheet" },
    ["<leader>ph"] = { function() require("nvchad.themes").open() end, "telescope nvchad themes" },

    ["<leader>pn"] = { function() require("lazy").install() end, "Plugins Install" },
    ["<leader>ps"] = { function() require("lazy").home() end, "Plugins Status" },
    ["<leader>pS"] = { function() require("lazy").sync() end, "Plugins Sync" },
    ["<leader>pu"] = { function() require("lazy").check() end, "Plugins Check Updates" },
    ["<leader>pU"] = { function() require("lazy").update() end, "Plugins Update" },

    ["<leader>pm"] = { "<cmd>Mason<cr>", "Mason Installer" },
    ["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", "Mason Update" },
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
    ["<leader>gf"] = { "<cmd>DiffviewFileHistory %<cr>", "Open DiffviewFileHistory current file" },
    ["<leader>go"] = { "<cmd>DiffviewOpen<cr>", "Open Diffview" },
    ["<leader>gx"] = { "<cmd>DiffviewClose<cr>", "Close Diffview" },

    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gC"] = {
      function() require("telescope.builtin").git_bcommits { use_file_path = true } end,
      "Git commits (current file)",
    },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end, "Reset hunk" },
    ["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, "Preview hunk" },
    ["<leader>gd"] = { function() require("gitsigns").toggle_deleted() end, "Toggle deleted" },

    ["<leader>gb"] = { "<cmd>Gitsigns blame_line<cr>", "Open git blame line" },
    ["<leader>gB"] = { "<cmd>Gitsigns blame<cr>", "Open git blame" },

  },
}

M.lspconfig = {
  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["gd"] = { function() require("telescope.builtin").lsp_definitions() end, "LSP definition" },
    ["<leader>ld"] = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic" },
    ["<leader>lf"] = { function() vim.lsp.buf.format { async = true, timeout = 5000 } end, "LSP formatting" },
    ["<leader>fm"] = {
      -- function() vim.lsp.buf.format { async = true, timeout = 5000 } end,
      function() require("conform").format { async = true, timeout = 5000 } end,
      "LSP formatting",
    },
    ["<leader>ls"] = { function() vim.lsp.buf.signature_help() end, "LSP signature help" },
    ["<leader>lt"] = { function() require("telescope.builtin").lsp_type_definitions() end, "LSP definition type" },
    -- ["<leader>lr"] = { function() require("nvchad.renamer").open() end, "LSP rename" },
    ["<leader>lr"] = { function() vim.lsp.buf.rename() end, "LSP rename" },
    ["<leader>la"] = { function() vim.lsp.buf.code_action() end, "LSP code action" },
    ["<leader>lR"] = { function() require("telescope.builtin").lsp_references() end, "LSP references" },

    ["[d"] = { function() vim.diagnostic.goto_prev { float = { border = "rounded" } } end, "Goto prev diagnostic" },
    ["]d"] = { function() vim.diagnostic.goto_next { float = { border = "rounded" } } end, "Goto next diagnostic" },
    ["<leader>lq"] = { function() vim.diagnostic.setloclist() end, "Diagnostic setloclist" },
    ["<leader>lwa"] = { function() vim.lsp.buf.add_workspace_folder() end, "Add workspace folder" },
    ["<leader>lwr"] = { function() vim.lsp.buf.remove_workspace_folder() end, "Remove workspace folder" },
    ["<leader>lwl"] = {
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      "List workspace folders",
    },

    ["<leader>li"] = { function() require("lspimport").import() end, "LSP autoimport" },
  },

  v = {
    ["<leader>la"] = { function() vim.lsp.buf.code_action() end, "LSP code action" },
  },
}

M.nvterm = {
  t = {
    ["<A-f>"] = { function() require("nvchad.term").toggle { pos = "float", id = "floatTerm" } end, "Toggle floating term" },
    ["<A-h>"] = { function() require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" } end, "Toggle horizontal term" },
    ["<A-v>"] = { function() require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" } end, "Toggle vertical term" },
  },

  n = {
    ["<A-f>"] = { function() require("nvchad.term").toggle { pos = "float", id = "floatTerm" } end, "Toggle floating term" },
    ["<A-h>"] = { function() require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" } end, "Toggle horizontal term" },
    ["<A-v>"] = { function() require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" } end, "Toggle vertical term" },

    -- new
    ["<leader>tf"] = { function() require("nvchad.term").new { pos = "float" } end, "New floating term" },
    ["<leader>th"] = { function() require("nvchad.term").new { pos = "sp" } end, "New horizontal term" },
    ["<leader>tv"] = { function() require("nvchad.term").new { pos = "vsp" } end, "New vertical term" },

    ["<leader>to"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },
  },
}

M.blankline = {
  n = {
    ["gj"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
    },
  },
}

-- Set all keymaps
for category, tbl in pairs(M) do
  for mode, tbl in pairs(tbl) do
    for key, val in pairs(tbl) do
      -- print(mode, key, val[1], val[2])
      map(mode, key, val[1], { desc = val[2] })
    end
  end
end
