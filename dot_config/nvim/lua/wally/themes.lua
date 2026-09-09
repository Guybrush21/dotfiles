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
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
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
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
