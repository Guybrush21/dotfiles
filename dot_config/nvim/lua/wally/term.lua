require('toggleterm').setup {
  direction = 'horizontal',
  open_mapping = [[<C-\>]],
}

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>ToggleTerm direction=horizontal dir=.<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-i>', '<cmd>ToggleTerm direction=float dir=.<cr>', { noremap = true, silent = true })
