require 'wally.options'
require 'wally.remap'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require 'wally.plugins.lazy'
require 'wally.term'

require('rose-pine').setup {
  variant = 'moon',
  styles = { italic = false },
  highlight_groups = {
    Comment = { italic = true },
    ['@comment'] = { italic = true },
  },
}

vim.cmd 'colorscheme rose-pine-moon'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
