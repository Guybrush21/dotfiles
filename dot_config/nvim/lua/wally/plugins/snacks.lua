return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = {},
    notifier = {},
    terminal = {},
    words = {},
    image = {},
    input = {},
    indent = {},
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = false,
          include = { '.env' },
          jump = { close = true },
          win = { list = { keys = { ['\\'] = 'close' } } },
        },
      },
    },
  },
  keys = {
    {
      '\\',
      function()
        Snacks.explorer()
      end,
      desc = 'Explorer',
    },
    {
      ']]',
      function()
        Snacks.words.jump(vim.v.count1, true)
      end,
      desc = 'Next reference',
    },
    {
      '[[',
      function()
        Snacks.words.jump(-vim.v.count1, true)
      end,
      desc = 'Previous reference',
    },
    {
      '<C-space>',
      function()
        Snacks.terminal()
      end,
      mode = { 'n', 'i', 't' },
      desc = 'Toggle terminal',
    },
    {
      '<A-i>',
      function()
        Snacks.terminal(nil, { win = { position = 'float' } })
      end,
      desc = 'Toggle floating terminal',
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
  },
  init = function()
    -- LSP progress via notifier (ex fidget), from snacks notifier docs
    vim.api.nvim_create_autocmd('LspProgress', {
      ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      callback = function(ev)
        local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
        vim.notify(vim.lsp.status(), 'info', {
          id = 'lsp_progress',
          title = 'LSP Progress',
          opts = function(notif)
            notif.icon = ev.data.params.value.kind == 'end' and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
          end,
        })
      end,
    })
  end,
}
