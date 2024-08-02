local M = {}

M.base_30 = {
  -- white = "#D9E0EE",
  white = "#cdd6f4",
  -- darker_black = "#191828",
  darker_black = "#181825",
  black = "#1E1E2E",  --  nvim bg
  black2 = "#242437",
  one_bg = "#2e2e47", -- real bg of onedark
  -- one_bg2 = "#363653",
  one_bg2 = "#282853",
  one_bg3 = "#3e3e5e",
  grey = "#45475a",
  grey_fg = "#4e5066",
  grey_fg2 = "#52556b",
  light_grey = "#585b70",
  red = "#F38BA8",
  baby_pink = "#ffa5c3",
  pink = "#F5C2E7",
  line = "#383747", -- for lines like vertsplit
  green = "#A6e3a1",
  vibrant_green = "#b5e8b1",
  nord_blue = "#8bc2f0",
  blue = "#89B4FA",
  yellow = "#FAE3B0",
  sun = "#ffe9b6",
  purple = "#d0a9e5",
  dark_purple = "#c7a0dc",
  teal = "#B5E8E0",
  orange = "#F8BD96",
  cyan = "#89DCEB",
  statusline_bg = "#232234",
  lightbg = "#2f2e47",
  pmenu_bg = "#A6e3a1",
  folder_bg = "#89B4FA",
  lavender = "#cdd6f4",
}

M.base_16 = {
  base00 = "#1E1E2E",
  base01 = "#28283e",
  base02 = "#2f2e47",
  base03 = "#37394d",
  base04 = "#414254",
  base05 = "#bfc6d4",
  base06 = "#ccd3e1",
  base07 = "#D9E0EE",
  base08 = "#b4befe",
  base09 = "#Fab387",
  base0A = "#F9e2af",
  base0B = "#A6e3a1",
  base0C = "#89DCEB",
  base0D = "#89B4FA",
  base0E = "#CBA6F7",
  base0F = "#F38BA8",
}

local mix_color_with_opacity = function(hex1, hex2, opacity)
  local hex2rgb = require("base46.colors").hex2rgb

  local r1, g1, b1 = hex2rgb(hex1)
  local r2, g2, b2 = hex2rgb(hex2)

  local r = r1 + (r2 - r1) * opacity
  local g = g1 + (g2 - g1) * opacity
  local b = b1 + (b2 - b1) * opacity

  return require("base46.colors").rgb2hex(r, g, b)
end

M.polish_hl = {
  ["@variable"] = { fg = M.base_30.lavender },
  ["@property"] = { fg = M.base_30.teal },
  ["@variable.builtin"] = { fg = M.base_30.red },
  -- luaTSField = { fg = M.base_16.base0D },
  -- ["@tag.delimiter"] = { fg = M.base_30.cyan },
  -- ["@function"] = { fg = M.base_30.orange },
  ["@parameter"] = { fg = "#eba0ac" },
  -- ["@constructor"] = { fg = M.base_16.base0A },
  -- ["@tag.attribute"] = { fg = M.base_30.orange },
  Visual = { bg = M.base_30.grey, bold = true }, -- Visual mode selection
  Comment = { fg = M.base_30.light_grey },
  CursorLine = { bg = M.base_30.black2 },
}

M.add_hl = {
  DiffAdd = {
    bg = mix_color_with_opacity(M.base_30.black, M.base_30.green, 0.2),
  },

  DiffChange = {
    bg = mix_color_with_opacity(M.base_30.black, M.base_30.light_grey, 0.2),
  },

  DiffDelete = {
    bg = mix_color_with_opacity(M.base_30.black, M.base_30.red, 0.2),
  },

  DiffText = {
    bg = mix_color_with_opacity(M.base_30.black, M.base_30.blue, 0.4),
  },
}

M = require("base46").override_theme(M, "catppuccin-mocha")

for k, v in pairs(M.polish_hl) do
  print(k, v)
end
M.type = "dark"

return M
