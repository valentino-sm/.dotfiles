return {
  {
    "rebelot/heirline.nvim",
    config = function(plugin, opts)
      local status = require "astronvim.utils.status"
      opts.statusline[4] = status.component.file_info { filename = { modify = ":." } }
      require "plugins.configs.heirline"(plugin, opts)
    end,
  },
}
