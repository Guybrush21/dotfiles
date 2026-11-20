-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  {
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
      event_handlers = {

        {
          -- 'file_opened' (not 'file_open_requested'): the latter fires before the
          -- window picker runs, so closing there leaves the picker nothing to pick
          event = 'file_opened',
          handler = function()
            require('neo-tree.command').execute { action = 'close' }
          end,
        },
      },
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
      filesystem = {
        filtered_items = {
          always_show = { '.env' },
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        window = {
          mappings = {
            ['\\'] = 'close_window',
            ['<cr>'] = 'open_with_window_picker',
            ['S'] = 'split_with_window_picker',
            ['s'] = 'vsplit_with_window_picker',
          },
        },
      },
    },
  },

  {
    's1n7ax/nvim-window-picker',
    version = '2.*',
    config = function()
      -- Hint colors from the active colorscheme. The plugin only sets its own
      -- (red/green) colors when these groups don't exist, and reads them at
      -- draw time, so redefining them on ColorScheme keeps them in sync.
      local function set_picker_hl()
        local accent = vim.api.nvim_get_hl(0, { name = 'Function', link = false }).fg
        local base = vim.api.nvim_get_hl(0, { name = 'Normal', link = false }).bg
        local hl = { fg = base, bg = accent, bold = true }
        for _, group in ipairs { 'WindowPickerStatusLine', 'WindowPickerStatusLineNC', 'WindowPickerWinBar', 'WindowPickerWinBarNC' } do
          vim.api.nvim_set_hl(0, group, hl)
        end
      end
      set_picker_hl()
      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('wally_window_picker_hl', { clear = true }),
        callback = set_picker_hl,
      })

      require('window-picker').setup {
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            -- NB: on nvim 0.12 this list replaces the plugin defaults, so keep them here
            filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'snacks_notif', 'snacks_notif_history' },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { 'terminal', 'quickfix' },
          },
        },
      }
    end,
  },
}
