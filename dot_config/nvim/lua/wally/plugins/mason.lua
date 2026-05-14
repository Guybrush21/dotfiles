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
        'jdtls',
        'omnisharp',
        'eslint-lsp',
        'lua-language-server',
      },
    },
  },
}
