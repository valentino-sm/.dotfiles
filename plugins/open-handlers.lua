return {
  "mrshmllow/open-handlers.nvim",
  -- We modify builtin functions, so be careful lazy loading
  -- lazy = false,
  -- cond = vim.ui.open ~= nil,
  -- config = function()
  --   local oh = require("open-handlers")
  --
  --   oh.setup({
  --     -- In order, each handler is tried.
  --     -- The first handler to successfully open will be used.
  --     handlers = {
  --       oh.issue, -- A builtin which handles github and gitlab issues
  --       oh.commit, -- A builtin which handles git commits
  --       oh.native -- Default native handler. Should always be last
  --     },
  --   })
  -- end,
}
