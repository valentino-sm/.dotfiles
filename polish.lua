-- Display diagnostics as virtual text only if not in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
    })
  end
})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.diagnostic.config({
      virtual_text = true,
    })
  end
})
-- vim.o.completeopt = 'menuone,select'

