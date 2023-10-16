return {
  n = {
    ["<leader>bn"] = {
      "<cmd>tabnew<cr>",
      desc = "New tab",
    },
    --   ["<leader>c"] = {
    --     function()
    --       local bufs = vim.fn.getbufinfo { buflisted = true }
    --       if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
    --       require("astronvim.utils.buffer").close(0)
    --     end,
    --     desc = "Close buffer",
    --   },
  },
}
