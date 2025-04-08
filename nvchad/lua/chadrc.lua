---@type ChadrcConfig

vim.cmd("highlight St_relativepath guifg=#626a83 guibg=#2a2b36")

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end


local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  -- theme = "catppuccin-mocha",
  -- theme_toggle = { "catppuccin-mocha", "one_light" },

  -- hl_override = highlights.override,
  -- hl_add = highlights.add,

  -- nvdash = {
  --   load_on_startup = true,
  --   header = {
  --     [[                                                          ]],
  --     [[                                                          ]],
  --     [[                                                          ]],
  --     [[            ██  ████████  ██                              ]],
  --     [[            ████████████████                              ]],
  --     [[            ██████████████████                            ]],
  --     [[          ████  ████  ██████████                          ]],
  --     [[          ████████████████████████                        ]],
  --     [[          ██████    ██████████████████                    ]],
  --     [[          ██  ██  ████  ████████████████████████████      ]],
  --     [[          ████        ████████████████████████            ]],
  --     [[          ████████████████████████████████████            ]],
  --     [[          ████████████████████████████████████            ]],
  --     [[          ████████████████████████████████████            ]],
  --     [[          ████████████████████████████████████            ]],
  --     [[          ██████████████████████████████████              ]],
  --     [[            ████████████████████████████████              ]],
  --     [[            ████    ████        ████    ████              ]],
  --     [[            ████    ████        ████    ████              ]],
  --     [[            ██      ██          ██      ██                ]],
  --   },
  --   -- buttons = {},
  -- },

  statusline = require "configs.statusline",
  statusline = {
    theme = "default",
    order = { "mode", "relativepath", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      relativepath = function()
        local path = vim.api.nvim_buf_get_name(stbufnr())

        if path == "" then
          return ""
        end

        return "%#St_relativepath#  " .. vim.fn.expand("%:.:h") .. " /"
      end,
    },
  },
}

M.base46 = {
  integrations = {
    "notify",
    "rainbowdelimiters",
  },
}
-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
