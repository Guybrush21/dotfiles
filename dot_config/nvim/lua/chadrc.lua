-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
  ui = {
    statusline = {
      theme = "default",
      separator_style = "default",
      order = { "mode", "f", "file", "git", "%=", "lsp_msg", "diagnostics", "%=", "blame", "cursor", "lsp", "cwd" },
      modules = {

        f = function()
          local current_buffer_path = vim.api.nvim_buf_get_name(0)
          local current_relative_path = vim.fn.fnamemodify(current_buffer_path, ":~:.:h")

          return "%#St_file#" .. current_relative_path .. "/"
        end,

        blame = "%{get(b:,'gitsigns_blame_line','')}",
      },
    },
  },
}

M.base46 = {
  theme = "onedark",
  transparency = false,
  integrations = { "vim-illuminate" },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    IlluminatedWordText = { reverse = false, bg = "one_bg", bold = false },
    IlluminatedWordRead = { reverse = false, bg = "one_bg", bold = false },
    IlluminatedWordWrite = { reverse = false, bg = "one_bg", bold = false },
  },
}

return M
