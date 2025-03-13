return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align',
        delay = 200,
        ignore_whitespace = true,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame = true,

      on_attach = function()
        local gitsigns = require 'gitsigns'
        vim.keymap.set('n', '<leader>Gt', gitsigns.toggle_current_line_blame, { desc = 'Git Toggle Virtual Blame' })
        vim.keymap.set('n', '<leader>Gb', gitsigns.blame_line, { desc = 'Git blame line' })
      end,
    },
  },
}
