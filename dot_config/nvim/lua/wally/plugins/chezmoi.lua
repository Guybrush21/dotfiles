return {
	{
		"xvzc/chezmoi.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("chezmoi").setup({})

			vim.keymap.set("n", "<leader>cz", function()
				require("chezmoi.pick").telescope()
			end)

			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = { vim.fn.expand("~") .. "/.local/share/chezmoi/*" },
				callback = function(ev)
					vim.schedule(function()
						require("chezmoi.commands.__edit").watch(ev.buf)
					end)
				end,
			})
		end,
	},
	{
		"alker0/chezmoi.vim",
		lazy = false,
		init = function()
			vim.g["chezmoi#use_tmp_buffer"] = 1
		end,
	},
}
