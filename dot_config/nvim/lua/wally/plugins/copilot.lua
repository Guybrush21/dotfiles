return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        debounce = 25,
        keymap = {
          accept = '<C-CR>',
          accept_word = false,
          accept_line = '<Tab>',
          next = '<C-]>',
          prev = false,
          dismiss = false,
        },
      },
    }
  end,
}
