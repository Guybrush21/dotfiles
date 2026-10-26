return {
	"dlyongemallo/diffview-plus.nvim",
	version = "*",

	config = function()
		-- Toggle diffview open/close
		vim.keymap.set("n", "<leader>gv", "<cmd>DiffviewToggle<cr>", { desc = "Toggle Diffview" })

		-- Diff working directory
		vim.keymap.set("n", "<leader>go", "<cmd>DiffviewOpen<cr>", { desc = "Diffview open" })
		vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Diffview close" })

		-- File history
		vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File history (current file)" })
		vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "File history (repo)" })

		-- Visual mode: history for selection
		vim.keymap.set("v", "<leader>gh", "<Esc><cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = "Range history" })

		-- Single line history
		vim.keymap.set("n", "<leader>gl", "<cmd>.DiffviewFileHistory --follow<CR>", { desc = "Line history" })

		-- Diff against main/master branch (useful before merging)
		vim.keymap.set("n", "<leader>gm", function()
			-- Try main first, fall back to master
			local result = vim.fn.systemlist({ "git", "rev-parse", "--verify", "main" })
			local ok = vim.v.shell_error == 0 and result[1] ~= nil and result[1] ~= ""
			local branch = ok and "main" or "master"
			vim.cmd("DiffviewOpen " .. branch)
		end, { desc = "Diff against main/master" })
	end,
	-- optional: lazy-load on command
	-- cmd = {
	--     "DiffviewOpen",
	--     "DiffviewToggle",
	--     "DiffviewFileHistory",
	--     "DiffviewDiffFiles",
	--     "DiffviewLog",
	-- },
	--
	opt = {
		default_args = {
			DiffviewOpen = { "--imply-local" },
		},
		file_panel = {
			show_branch_name = true,
			always_show_sections = true,
		},
		enhanced_diff_hl = true,
		diffopt = { algorithm = "histogram" },
	},
}
