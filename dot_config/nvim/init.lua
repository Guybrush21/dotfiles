if vim.g.vscode then
  require 'wally.options'
  require 'wally.remap'
else
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

  vim.cmd("colorscheme tokyonight")

  vim.lsp.enable {
    'astro',
    'vtsls',
    'html',
    'cssls',
    'tailwindcss',
    'eslint',
    'lua_ls',
    'roslyn',
  }
end
