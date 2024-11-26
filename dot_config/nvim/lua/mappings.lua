require "nvchad.mappings"
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map("i", "<C-CR>", 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false,
-- })
--
-- vim.g.copilot_no_tab_map = true
--
-- map("i", "<C-L>", "<Plug>(copilot-accept-word)")
-- map({ "n", "i" }, "<C-`>", "<Plug>(copilot-suggest)")
--
-- map({ "i" }, "<C-]>", "<Plug>(copilot-next)")
-- map({ "i" }, "<C-[>", "<Plug>(copilot-previous)")
-- map({ "n" }, "<C-F12>", "<Plug>(copilot-panel)")

map("n", "<leader>a", vim.lsp.buf.code_action, { desc = "LSP code action" })
map("n", "<leader>.", vim.lsp.buf.code_action, { desc = "LSP code action" })
map("n", "gr", vim.lsp.buf.references, { desc = "LSP Symbol References" })
map("n", ",", vim.diagnostic.open_float, { desc = "LSP open float" })

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

map("i", "<C-CR>", function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
  end
end, { desc = "Copilot Accept" })

map("n", "<leader>gb", require("gitsigns").blame_line, { desc = "Git Blame current line" })
map("n", "<leader>gB", require("gitsigns").toggle_current_line_blame, { desc = "Git Blame Toggle" })

map("n", "<leader>fF", function()
  require("nvim-tree.api").tree.find_file { focus = true }
end, { desc = "Tree focus file" })

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

if vim.g.neovide then
  map({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  map({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  map({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
