---@type ChadrcConfig

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

local M = {}

M.ui = {
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

M.nvdash = {
  load_on_startup = true,
  header = {
    [[            ██  ████████  ██                              ]],
    [[            ████████████████                              ]],
    [[            ██████████████████                            ]],
    [[          ████  ████  ██████████                          ]],
    [[          ████████████████████████                        ]],
    [[          ██████    ██████████████████                    ]],
    [[          ██  ██  ████  ████████████████████████████      ]],
    [[          ████        ████████████████████████            ]],
    [[          ████████████████████████████████████            ]],
    [[          ████████████████████████████████████            ]],
    [[          ████████████████████████████████████            ]],
    [[          ████████████████████████████████████            ]],
    [[          ██████████████████████████████████              ]],
    [[            ████████████████████████████████              ]],
    [[            ████    ████        ████    ████              ]],
    [[            ████    ████        ████    ████              ]],
    [[            ██      ██          ██      ██                ]],
    [[                                                          ]],
    [[                                                          ]],
  },
}

local highlights = require "highlights"

M.base46 = {
  theme = "catppuccin-mocha",
  theme_toggle = { "catppuccin-mocha", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  integrations = {
    "notify",
    "rainbowdelimiters",
  },
}

return M
