return {
  'seblyng/roslyn.nvim',
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {},
  config = function(_, opts)
    require('roslyn').setup(opts)
    local init = require('roslyn.lsp.handlers')['workspace/projectInitializationComplete']
    vim.lsp.config('roslyn', {
      settings = {
        ['csharp|background_analysis'] = {
          dotnet_analyzer_diagnostics_scope = 'fullSolution',
          dotnet_compiler_diagnostics_scope = 'fullSolution',
        },
      },
      handlers = {
        -- solution loaded: pull diagnostics for every file, not just open buffers
        ['workspace/projectInitializationComplete'] = function(err, res, ctx)
          init(err, res, ctx)
          vim.lsp.buf.workspace_diagnostics { client_id = ctx.client_id }
        end,
      },
    })
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = '*.cs',
      callback = function()
        for _, c in ipairs(vim.lsp.get_clients { name = 'roslyn' }) do
          vim.lsp.buf.workspace_diagnostics { client_id = c.id }
        end
      end,
    })
  end,
}
