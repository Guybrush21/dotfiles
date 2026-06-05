local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    defaults = { lazy = true },
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  require 'wally.plugins.which-key',
  require 'wally.plugins.telescope',
  require 'wally.plugins.conform',
  require 'wally.plugins.blink',
  require 'wally.plugins.debug',
  require 'wally.plugins.neo-tree',
  require 'wally.plugins.gitsigns',
  require 'wally.plugins.copilot',
  require 'wally.plugins.neotest',
  require 'wally.plugins.mason',
  require 'wally.plugins.lspconfig',
  require 'wally.plugins.trouble',
  { import = 'wally.plug' },
}
