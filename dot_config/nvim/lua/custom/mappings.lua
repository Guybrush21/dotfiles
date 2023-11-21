---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gh"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },
  },
}

-- more keybinds!

return M
