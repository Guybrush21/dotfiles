return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        variant = 'moon',
        styles = { italic = false },
        highlight_groups = {
          Cursor = {},

          Comment = { italic = true },
          ['@comment'] = { italic = true },
          CurSearch = { fg = 'base', bg = 'leaf', inherit = false },
          Search = { fg = 'text', bg = 'leaf', blend = 20, inherit = false },
        },
      }
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    'navarasu/onedark.nvim',
  },
  {
    'karb94/neoscroll.nvim',
    keys = { '<C-d>', '<C-u>', 'zz' },
    config = function()
      require('neoscroll').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>dx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>dX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>ds',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>dL',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>dL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>dQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'RRethy/vim-illuminate',
    lazy = false,
    opts = {
      under_cursor = false,
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
}
