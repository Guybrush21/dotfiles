return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
	},
	{
		"karb94/neoscroll.nvim",
		keys = { "<C-d>", "<C-u>", "zz" },
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"UrsaDK/vim-illuminate",
		lazy = false,
		opts = {
			under_cursor = true,
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
		end,
	},
	{
		"akinsho/toggleterm.nvim",
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},

	{ "sindrets/diffview.nvim" },
	{ "j-hui/fidget.nvim", opts = {} },
	{
		"seblyng/roslyn.nvim",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {},
		config = function(_, opts)
			require("roslyn").setup(opts)
			local init = require("roslyn.lsp.handlers")["workspace/projectInitializationComplete"]
			vim.lsp.config("roslyn", {
				settings = {
					["csharp|background_analysis"] = {
						dotnet_analyzer_diagnostics_scope = "fullSolution",
						dotnet_compiler_diagnostics_scope = "fullSolution",
					},
				},
				handlers = {
					-- solution loaded: pull diagnostics for every file, not just open buffers
					["workspace/projectInitializationComplete"] = function(err, res, ctx)
						init(err, res, ctx)
						vim.lsp.buf.workspace_diagnostics({ client_id = ctx.client_id })
					end,
				},
			})
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*.cs",
				callback = function()
					for _, c in ipairs(vim.lsp.get_clients({ name = "roslyn" })) do
						vim.lsp.buf.workspace_diagnostics({ client_id = c.id })
					end
				end,
			})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}
