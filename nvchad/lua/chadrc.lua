---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "catppuccin-mocha",
  theme_toggle = { "catppuccin-mocha", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,
    header = {
      [[                                                          ]],
      [[                                                          ]],
      [[                                                          ]],
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
    },
    -- buttons = {},
  },

  -- statusline = require "configs.statusline",
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
