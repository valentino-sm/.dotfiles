---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin-mocha",
  theme_toggle = { "catppuccin-mocha", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,
    header = {
      [[██████████████████████████████████████████████████████████]],
      [[██████████████████████████████████████████████████████████]],
      [[██████████████████████████████████████████████████████████]],
      [[████████████  ██        ██  ██████████████████████████████]],
      [[████████████                ██████████████████████████████]],
      [[████████████                  ████████████████████████████]],
      [[██████████    ██    ██          ██████████████████████████]],
      [[██████████                        ████████████████████████]],
      [[██████████      ████                  ████████████████████]],
      [[██████████  ██  ██    ██                            ██████]],
      [[██████████    ████████                        ████████████]],
      [[██████████                                    ████████████]],
      [[██████████                                    ████████████]],
      [[██████████                                    ████████████]],
      [[██████████                                    ████████████]],
      [[██████████                                  ██████████████]],
      [[████████████                                ██████████████]],
      [[████████████    ████    ████████    ████    ██████████████]],
      [[████████████    ████    ████████    ████    ██████████████]],
      [[████████████  ██████  ██████████  ██████  ████████████████]],
    },
    -- buttons = {},
  },

  statusline = require "custom.configs.statusline",

  extended_integrations = {
    "notify",
    "rainbowdelimiters",
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
