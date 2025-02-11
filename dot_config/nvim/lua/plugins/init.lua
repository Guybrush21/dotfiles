return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "sql",
        "vue",
        "astro",
        "markdown",
      },
    },
  },
  { "nvim-telescope/telescope-ui-select.nvim", after = "telescope.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<S-Down>"] = function(...)
              require("telescope.actions").cycle_history_next(...)
            end,
            ["<S-Up>"] = function(...)
              require("telescope.actions").cycle_history_prev(...)
            end,
          },
        },
        path_display = { "smart" },
      },
      extensions_list = { "fzf", "ui-select", "themes" },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      },
    },
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },
  -- { "github/copilot.vim", lazy = false },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = { auto_refresh = true, layout = { position = "right" }, open = "<C-F12>" },
      suggestion = {
        auto_trigger = true,
        accept = "<C-CR>",
        next = "<M-]>",
        prev = "<M-[",
      },
    },
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      {
        "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        opts = {},
      },
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    },
    config = true,
    lazy = false,
    opts = {
      strategies = {
        chat = { adapter = "copilot" },
        inline = { adapter = "copilot" },
        agent = { adapter = "copilot" },
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = false,
        exclude = { ".env" },
      },
      view = {
        width = {
          max = 70,
        },
      },
      diagnostics = {
        enable = true,
        show_on_open_dirs = true,
      },
      update_focused_file = {
        enable = false,
      },
    },
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run()
        end,
        desc = "Test near",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.fun(vim.fn.expand "%")
        end,
        desc = "Test file",
      },
      {
        "<leader>ts",
        function()
          require("neotest").summary.open()
        end,
        desc = "Test summary",
      },
      {
        "<leader>to",
        function()
          require("neotest").output_panel.open()
        end,
        desc = "Test output",
      },
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-jest" {
            jestCommand = "pnpm run test",
            -- jestConfigFile = "custom.jest.config.ts",
            -- jestConfigFile = function(file)
            --   if string.find(file, "/packages/") then
            --     return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            --   end
            --
            --   return vim.fn.getcwd() .. "/jest.config.ts"
            -- end,
            env = { CI = true },
            cwd = function(file)
              if string.find(file, "/apps/") then
                return string.match(file, "(.-/[^/]+/)src")
              end
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>dx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>dX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ds",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>dL",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>dL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>dQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "RRethy/vim-illuminate",
    lazy = false,
    opts = {
      under_cursor = false,
    },
    keys = {
      {
        "]]",
        function()
          require("illuminate").goto_next_reference(true)
        end,
        desc = "illuminate Next reference",
      },
      {
        "[[",
        function()
          require("illuminate").goto_prev_reference(true)
        end,
        desc = "illuminate Previous reference",
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
      dofile(vim.g.base46_cache .. "vim-illuminate")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_pos = "right_align",
        delay = 0,
      },
    },
    keys = {
      {
        "<leader>gb",
        require("gitsigns").blame_line,
        desc = "Git Blame current line",
      },
      -- comment
      {
        "<leader>gB",
        require("gitsigns").toggle_current_line_blame,
        desc = "Git Blame Toggle",
      },
    },
    dependencies = {
      {
        "sindrets/diffview.nvim",
        config = true,
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    ft = { "markdown" },
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "/" },
    },
    -- { "windwp/nvim-autopairs", enabled = false },
  },
}
