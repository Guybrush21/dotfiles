-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  transparency = false,
  integrations = { "vim-illuminate" },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    IlluminatedWordText = { reverse = false, bg = "one_bg" },
    IlluminatedWordRead = { reverse = false, bg = "one_bg" },
    IlluminatedWordWrite = { reverse = false, bg = "one_bg" },
  },
}

return M
