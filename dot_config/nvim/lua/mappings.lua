require "nvchad.mappings"

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
