require "nvchad.mappings"
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map("i", "<C-CR>", 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false,
-- })

-- vim.g.copilot_no_tab_map = true

-- map("i", "<C-L>", "<Plug>(copilot-accept-word)")
-- map({ "n", "i" }, "<C-`>", "<Plug>(copilot-suggest)")
--

map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "LSP code action" })
map("n", "<leader>.", vim.lsp.buf.code_action, { desc = "LSP code action" })

map("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP rename" })
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
  "<leader>A",
  "<cmd>CodeCompanionChat Toggle<cr>",
  { noremap = true, silent = true, desc = "Companion Toggle" }
)
map({ "n", "v" }, "<leader>W", "<cmd>'WindowsToggleAutowidth<cr>", { desc = "Toggle Auto Width" })
