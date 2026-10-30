return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"angular",
			"astro",
			"c_sharp",
			"css",
			"html",
			"lua",
			"javascript",
			"rust",
			"svelte",
			"typescript",
			"tsx",
		})
	end,
}
