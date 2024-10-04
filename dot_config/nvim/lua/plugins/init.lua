return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
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
      },
      extensions_list = { "fzf", "ui-select", "themes" },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      },
    },
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  -- { "github/copilot.vim", lazy = false },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = { auto_refresh = true, layout = { position = "right" } },
      suggestion = {
        auto_trigger = true,
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
      },
      view = {
        width = {
          max = 80,
        },
      },
      update_focused_file = {
        enable = true,
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
        "<leader>Xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>XX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>XL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>XQ",
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
}
