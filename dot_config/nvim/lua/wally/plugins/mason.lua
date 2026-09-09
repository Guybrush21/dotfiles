return {
  { 'mason-org/mason.nvim', opts = {} },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        'vtsls',
        'html-lsp',
        'css-lsp',
        'tailwindcss-language-server',
        'eslint-lsp',
        'lua-language-server',
        'stylua',
        'angular-language-server',
        'netcoredbg',
        'prettierd',
        'roslyn-language-server',
      },
    },
  },
}
