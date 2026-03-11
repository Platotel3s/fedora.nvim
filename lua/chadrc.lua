-- ~/.config/nvim/lua/chadrc.lua
local M = {}

M.base46 = {
  theme = "neofusion",
  --transparency = true,
  hl_override = {
    TelescopeNormal = { bg = "none" },
    TelescopeBorder = { fg = "#45475a", bg = "none" },
    TelescopePromptBorder = { fg = "#86e1fc", bg = "none" },
    TelescopePromptTitle = { fg = "#000000", bg = "#86e1fc", bold = true },
    TelescopePreviewTitle = { fg = "#000000", bg = "#c3e88d", bold = true },
    TelescopeResultsTitle = { fg="#fffcdc", bg="#4C5C2D"},
    TelescopeSelection = { bg = "#2e303e", fg = "#ffffff", bold = true },
    NvimTreeNormal = { bg = "none" },
    NvimTreeNormalNC = { bg = "none" },
    NvimTreeWinSeparator = { fg = "#161617", bg = "none" },
    NvimTreeCursorLine = { bg = "#2e303e" },
    NvimTreeFolderName = { fg = "#86e1fc", bold = true },
    NvimTreeOpenedFolderName = { fg = "#86e1fc", italic = true },
    NvimTreeEmptyFolderName = { fg = "#545c7e" },
    NvimTreeIndentMarker = { fg = "#3b4261" },
    NvimTreeGitDirty = { fg = "#FFAA00" },
    NvimTreeGitNew = { fg = "#FF4400" },
    LineNr = { fg = "#3b4261" },
    CursorLineNr = { fg = "#ff9e64", bold = true },
    Visual = { bg = "#3d3750" },
    IblScope = { fg = "#565f89" },
  },
}

M.ui = {
  statusline = { enabled = false },
  nvimtree = {
    side = "left",
    width = 30,
    git_status = true,
  },
}

return M
