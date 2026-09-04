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
      -- vim.cmd.colorscheme 'rose-pine'
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'dark',
      }
      -- require('onedark').load()
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
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

  { 'sindrets/diffview.nvim' },
  { 'j-hui/fidget.nvim',        opts = {} },
  {
    'seblyng/roslyn.nvim',
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {},
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
    end,
  }

}
