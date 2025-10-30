return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      return {
        timeout_ms = 500,
        stop_after_first = true,
        lsp_format = 'fallback',
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      typescript = { 'prettierd' },
      javascript = { 'prettierd' },
      json = { 'prettierd' },
      jsonc = { 'prettierd' },
      vue = { 'prettierd' },
      sql = { 'prettierd', 'sqlfmt' },
      cs = { 'dotnet format' },
      markdown = { 'prettierd' },
      astro = { 'prettierd' },
      yaml = { 'prettierd' },
      xml = { 'prettierd', 'xmlformatter' },
    },
  },
}
