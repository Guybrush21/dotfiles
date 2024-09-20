require "nvchad.mappings"
local actions = require "telescope.actions"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-CR>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

vim.g.copilot_no_tab_map = true

map("i", "<C-L>", "<Plug>(copilot-accept-word)")

map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "LSP code action" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "gh", vim.lsp.buf.hover, { desc = "LSP hover" })

map(
  { "n", "v" },
  "<C-a>",
  "<cmd>CodeCompanionActions<cr>",
  { noremap = true, silent = true, desc = "Companion Actions" }
)
map(
  { "n", "v" },
  "<leader>i",
  "<cmd>CodeCompanionToggle<cr>",
  { noremap = true, silent = true, desc = "Companion Toggle" }
)

map("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true, desc = "Companion Add" })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd [[cab cc CodeCompanion]]
