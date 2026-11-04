return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
  },
  {
    'karb94/neoscroll.nvim',
    keys = { '<C-d>', '<C-u>', 'zz' },
    config = function()
      require('neoscroll').setup {
        duration_multiplier = 0.7,
      }
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      enabled = false,
    },
    keys = {
      { '<leader>md', '<cmd>RenderMarkdownToggle<cr>', desc = 'Toggle Markdown Preview' },
    },
  },
}
