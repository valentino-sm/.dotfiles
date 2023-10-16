-- Display diagnostics as virtual text only if not in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.diagnostic.config {
      virtual_text = true,
    }
  end,
})
-- Show NeoTree on startup
-- vim.api.nvim_create_augroup("neotree", {})
-- vim.api.nvim_create_autocmd("UiEnter", {
--   desc = "Open Neotree automatically",
--   group = "neotree",
--   callback = function()
--     if vim.fn.argc() == 0 then vim.cmd "Neotree toggle" end
--   end,
-- })
-- vim.o.completeopt = 'menuone,select'
-- dap
-- require("dap-python").setup "/usr/bin/python3"
-- local dap, dapui = require "dap", require "dapui"

-- when to stop on exception (uncaught is providing post mortem debugging) (see dap-api)
-- require("dap").set_exception_breakpoints { "raised", "uncaught" }

require("dap").configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file with external modules",
    justMyCode = false,
    program = "${file}",
  },
}
