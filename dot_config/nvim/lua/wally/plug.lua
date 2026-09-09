return {
  {
    'karb94/neoscroll.nvim',
    keys = { '<C-d>', '<C-u>', 'zz' },
    config = function()
      require('neoscroll').setup()
    end,
  },
  {
    'UrsaDK/vim-illuminate',
    lazy = false,
    opts = {
      under_cursor = true,
    },
    keys = {
      {
        ']]',
        function()
          require('illuminate').goto_next_reference(true)
        end,
        desc = 'illuminate Next reference',
      },
      {
        '[[',
        function()
          require('illuminate').goto_prev_reference(true)
        end,
        desc = 'illuminate Previous reference',
      },
    },
    config = function(_, opts)
      require('illuminate').configure(opts)
    end,
  },
  {
    'akinsho/toggleterm.nvim',
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  { 'sindrets/diffview.nvim' },
  { 'j-hui/fidget.nvim', opts = {} },
  {
    'seblyng/roslyn.nvim',
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {},
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup {
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
            buftype = { 'terminal', 'quickfix' },
          },
        },
      }
    end,
  },
}
