return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      typescript = { 'prettierd' },
      javascript = { 'prettierd' },
      json = { 'prettierd' },
      vue = { 'prettierd' },
      sql = { 'prettierd', 'sqlfmt' },
      cs = { 'dotnet format' },
      markdown = { 'prettierd' },
    },
  },
}
