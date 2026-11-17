return {
  'nickjvandyke/opencode.nvim',
  event = 'VeryLazy',
  config = function()
    local opencode = require 'opencode'

    vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
      opencode.ask '@this: '
    end, { desc = 'Ask OpenCode' })

    vim.keymap.set({ 'n', 'x' }, '<leader>os', function()
      opencode.select()
    end, { desc = 'Select OpenCode action' })

    vim.keymap.set({ 'n', 'x' }, '<leader>or', function()
      return opencode.operator '@this'
    end, { desc = 'Send range to OpenCode', expr = true })

    vim.keymap.set('n', '<leader>ol', function()
      return opencode.operator '@this' .. '_'
    end, { desc = 'Send line to OpenCode', expr = true })
  end,
}
