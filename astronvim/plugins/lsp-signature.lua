return {
  -- Show Args Hint
  "ray-x/lsp_signature.nvim",
  event = "BufRead",
  config = function()
    require("lsp_signature").setup {
      doc_lines = 2,
      max_height = 12,
      max_width = 150,
      hint_enable = false,
      floating_window = true,
      hint_prefix = "⚙️ ",
      hint_inline = function() return false end,
      always_trigger = false,
      transparency = 25,
      handler_opts = {
        -- border = "single",
        -- border = "shadow",
        border = "rounded",
        -- border = "none",
      },
      toggle_key = "<M-e>",
      timer_interval = 2000,
    }
  end,
}
