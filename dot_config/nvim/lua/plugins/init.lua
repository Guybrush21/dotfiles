return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
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
      },
    },
  },
  -- { "nvim-telescope/telescope-ui-select.nvim", after = "telescope.nvim" },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   opts = {
  --     extensions_list = { "themes", "ui-select" },
  --     extensions = {
  --       ["ui-select"] = {
  --         require("telescope.themes").get_dropdown {},
  --       },
  --     },
  --   },
  --   dependencies = {
  --     "nvim-telescope/telescope-ui-select.nvim",
  --   },
  -- },
  --
  {
    "rmagatti/auto-session",
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_save_enabled = true,
    },
    lazy = false,
  },
  { "github/copilot.vim", lazy = false },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "prettierd",
        "stylua",
        "typescript-language-server",
        "tailwindcss-language-server",
        "sqlfmt",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = {},
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
    keys = { "<leader>tl", "<Plug>neotest-run" },
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
            jestCommand = "npx test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
  },
}