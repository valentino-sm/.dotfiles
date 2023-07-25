return {
  {
    "rebelot/heirline.nvim",
    config = function(plugin, opts)
      local get_hlgroup = require("astronvim.utils").get_hlgroup
      -- use helper function to get highlight group properties
      local blank_bg = get_hlgroup("Comment").fg
      local git_bg = get_hlgroup("ColorColumn").bg
      -- local git_fg = get_hlgroup("Delimiter").fg
      local git_fg = get_hlgroup("FloatTitle").fg
      local status = require "astronvim.utils.status"
      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        -- status.component.mode(),
        status.component.mode {
          mode_text = { icon = { kind = "VimIcon", padding = { left = 1, right = 1 } } },
          surround = {
            separator = "left",
            color = function() return { main = status.hl.mode_bg(), right = blank_bg } end,
          },
          padding = { right = 1 },
        },
        status.component.builder {
          { provider = "" },
          -- define the surrounding separator and colors to be used inside of the component
          -- and the color to the right of the separated out section
          surround = { separator = "left", color = { main = blank_bg, right = git_bg } },
        },
        status.component.git_branch {
          hl = { bg = git_bg, fg = git_fg },
          surround = {
            condition = function() return true end,
            separator = "left",
            color = { main = git_bg },
          },
          padding = { left = 0, right = 1 },
        },
        status.component.file_info {
          padding = { left = 0, right = 0 },
          filename = { modify = ":." },
        },
        status.component.git_diff(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.diagnostics {
          padding = { left = 0, right = 0 },
        },
        status.component.lsp {
          padding = { left = 0, right = 0 },
        },
        status.component.treesitter(),
        status.component.nav(),
        status.component.mode { surround = { separator = "right" } },
      }
      -- opts.statusline[4] = status.component.file_info { filename = { modify = ":." } }
      require "plugins.configs.heirline"(plugin, opts)
    end,
  },
}
