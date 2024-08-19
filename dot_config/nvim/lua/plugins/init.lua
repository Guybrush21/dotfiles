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
  { "nvim-telescope/telescope-ui-select.nvim", after = "telescope.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
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
  -- {
  --   "rmagatti/auto-session",
  --   opts = {
  --     log_level = "error",
  --     auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  --     auto_save_enabled = false,
  --   },
  --   lazy = false,
  -- },
  { "github/copilot.vim", lazy = false },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "prettierd",
        "stylua",
        -- "typescript-language-server",
        "tailwindcss-language-server",
        "sqlfmt",
        "vtsls",
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
    "tris203/precognition.nvim",
    keys = {
      {
        "<leader>T",
        function()
          require("precognition").toggle()
        end,
        desc = "Toggle precognition",
      },
    },
    config = {
      -- startVisible = true,
      -- showBlankVirtLine = true,
      highlightColor = { link = "Comment" },
      -- hints = {
      --      Caret = { text = "^", prio = 2 },
      --      Dollar = { text = "$", prio = 1 },
      --      MatchingPair = { text = "%", prio = 5 },
      --      Zero = { text = "0", prio = 1 },
      --      w = { text = "w", prio = 10 },
      --      b = { text = "b", prio = 9 },
      --      e = { text = "e", prio = 8 },
      --      W = { text = "W", prio = 7 },
      --      B = { text = "B", prio = 6 },
      --      E = { text = "E", prio = 5 },
      -- },
      -- gutterHints = {
      --     G = { text = "G", prio = 10 },
      --     gg = { text = "gg", prio = 9 },
      --     PrevParagraph = { text = "{", prio = 8 },
      --     NextParagraph = { text = "}", prio = 8 },
      -- },
    },
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
  {},
}
