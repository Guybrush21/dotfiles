-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>ed', ':Neotree document_symbols<CR>', desc = 'NeoTree Document Symbols', silent = true },
    { '<leader>eg', ':Neotree git_status<CR>', desc = 'NeoTree Git Status', silent = true },
    { '<leader>ee', ':Neotree filesystem<CR>', desc = 'NeoTree Filesystem', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
    sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
