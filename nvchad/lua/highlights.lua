local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  St_gitIcons = { bold = false },
  St_file_info = { bold = true },
  St_relativepath = { fg = "#626a83", bg = "#2f2e47" },
}

return M
