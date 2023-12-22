local fn = vim.fn
local sep_style = "arrow"

local default_sep_icons = {
  default = { left = "", right = "" },
  round = { left = "", right = "" },
  block = { left = "█", right = "█" },
  arrow = { left = "", right = "" },
}

local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

local sep_l = separators["left"]
local sep_r = separators["right"]

function stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

local function is_activewin()
  return vim.api.nvim_get_current_win() == vim.g.statusline_winid
end

local M = {}

M.modes = {
  ["n"] = { "NORMAL", "St_NormalMode" },
  ["no"] = { "NORMAL (no)", "St_NormalMode" },
  ["nov"] = { "NORMAL (nov)", "St_NormalMode" },
  ["noV"] = { "NORMAL (noV)", "St_NormalMode" },
  ["noCTRL-V"] = { "NORMAL", "St_NormalMode" },
  ["niI"] = { "NORMAL i", "St_NormalMode" },
  ["niR"] = { "NORMAL r", "St_NormalMode" },
  ["niV"] = { "NORMAL v", "St_NormalMode" },
  ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
  ["ntT"] = { "NTERMINAL (ntT)", "St_NTerminalMode" },

  ["v"] = { "VISUAL", "St_VisualMode" },
  ["vs"] = { "V-CHAR (Ctrl O)", "St_VisualMode" },
  ["V"] = { "V-LINE", "St_VisualMode" },
  ["Vs"] = { "V-LINE", "St_VisualMode" },
  [""] = { "V-BLOCK", "St_VisualMode" },

  ["i"] = { "INSERT", "St_InsertMode" },
  ["ic"] = { "INSERT (completion)", "St_InsertMode" },
  ["ix"] = { "INSERT completion", "St_InsertMode" },

  ["t"] = { "TERMINAL", "St_TerminalMode" },

  ["R"] = { "REPLACE", "St_ReplaceMode" },
  ["Rc"] = { "REPLACE (Rc)", "St_ReplaceMode" },
  ["Rx"] = { "REPLACEa (Rx)", "St_ReplaceMode" },
  ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
  ["Rvc"] = { "V-REPLACE (Rvc)", "St_ReplaceMode" },
  ["Rvx"] = { "V-REPLACE (Rvx)", "St_ReplaceMode" },

  ["s"] = { "SELECT", "St_SelectMode" },
  ["S"] = { "S-LINE", "St_SelectMode" },
  [""] = { "S-BLOCK", "St_SelectMode" },
  ["c"] = { "COMMAND", "St_CommandMode" },
  ["cv"] = { "COMMAND", "St_CommandMode" },
  ["ce"] = { "COMMAND", "St_CommandMode" },
  ["r"] = { "PROMPT", "St_ConfirmMode" },
  ["rm"] = { "MORE", "St_ConfirmMode" },
  ["r?"] = { "CONFIRM", "St_ConfirmMode" },
  ["x"] = { "CONFIRM", "St_ConfirmMode" },
  ["!"] = { "SHELL", "St_TerminalMode" },
}

M.mode = function()
  if not is_activewin() then
    return ""
  end

  local m = vim.api.nvim_get_mode().mode
  local current_mode = "%#" .. M.modes[m][2] .. "#" .. "  " .. M.modes[m][1]
  local mode_sep1 = "%#" .. M.modes[m][2] .. "Sep" .. "#" .. sep_r

  return current_mode .. mode_sep1 .. "%#ST_EmptySpace#" .. sep_r
end

M.fileInfo = function()
  local icon = " 󰈚 "
  -- local dir_name = fn.fnamemodify(fn.getcwd(), ":t")
  local path = vim.api.nvim_buf_get_name(stbufnr())
  path = fn.fnamemodify(path, ":~:.")
  -- local name = (path == "" and "Empty ") or path:match "([^/\\]+)[/\\]*$"
  local name = (path == "" and "Empty ") or path

  if name ~= "Empty " then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")

    if devicons_present then
      local ft_icon = devicons.get_icon(name)
      icon = (ft_icon ~= nil and " " .. ft_icon) or icon
    end

    name = " " .. name .. " "
  end

  -- return "%#St_file_info#" .. icon .. name .. "%#St_file_sep#" .. sep_r
  return "%#St_gitIcons#" .. icon .. name
end

M.git = function()
  if not vim.b[stbufnr()].gitsigns_head or vim.b[stbufnr()].gitsigns_git_status then
    return ""
  end

  local git_status = vim.b[stbufnr()].gitsigns_status_dict

  local added = git_status.added and ("  " .. git_status.added) or ""
  local changed = git_status.changed and ("  " .. git_status.changed) or ""
  local removed = git_status.removed and ("  " .. git_status.removed) or ""
  local branch_name = "  " .. git_status.head

  -- return "%#St_gitIcons#" .. branch_name .. added .. changed .. removed
  return "%#St_file_info#" .. branch_name .. added .. changed .. removed .. " " .. "%#St_file_sep#" .. sep_r
end

return {
  -- theme = "vscode_colored",
  -- theme = "minimal",
  -- separator_style = "arrow",
  overriden_modules = function(modules)
    modules[1] = M.mode()
    modules[2] = M.git()
    modules[3] = M.fileInfo()
    return modules
  end,
}
