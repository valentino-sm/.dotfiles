return {
  -- Show Args Hint
  "ray-x/lsp_signature.nvim",
  event = "BufRead",
  config = function()
    require("lsp_signature").setup {
      hint_enable = false,
    }
  end,
}
