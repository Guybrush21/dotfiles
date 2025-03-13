return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search Files' })
    vim.keymap.set('n', '<leader>fW', builtin.grep_string, { desc = 'Search current Word' })
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Search by Grep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Search Diagnostics' })
    vim.keymap.set('n', '<leader>fl', builtin.resume, { desc = 'Search Resume' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '  Find existing buffers' })
  end,
  opts = {
    path_display = { 'smart' },
  },
}
