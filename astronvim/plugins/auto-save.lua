return {
  "okuuva/auto-save.nvim",
  event = { "User AstroFile", "InsertEnter" },
  opts = {
    execution_message = {
      enabled = false,
    },
    trigger_events = {
      immediate_save = { "BufLeave" },
      defer_save = {},
    },
    -- trigger_events = { "ColorScheme" },
    debounce_delay = 2000,
  },
}
