return {
  "akinsho/toggleterm.nvim",
  opts = {
    on_create = function()
      vim.opt.foldcolumn = "0"
      vim.opt.signcolumn = "no"
      vim.api.nvim_command ":wa"
    end,
  },
}
