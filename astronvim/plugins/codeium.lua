return {
  "Exafunction/codeium.vim",
  -- cmd = "Codeium",
  -- init = function()
  --   vim.g.codeium_enabled = 1
  --   -- vim.g.codeium_disable_bindings = 1
  --   -- vim.g.codeium_idle_delay = 1500
  --   -- match function
  -- end,
  event = "User AstroFile",
  config = function()
    vim.keymap.set("i", "<C-s>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
    vim.keymap.set("i", "<M-]>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
    vim.keymap.set("i", "<M-[>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
    vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
    -- vim.api.nvim_set_hl(0, "CodeiumSuggestion", { link = "Comment" })
    vim.keymap.set("n", "<leader>;", function()
      if vim.g.codeium_enabled == true then
        vim.cmd "CodeiumDisable"
      else
        vim.cmd "CodeiumEnable"
      end
    end, { noremap = true, desc = "Toggle Codeium active" })
  end,

}
