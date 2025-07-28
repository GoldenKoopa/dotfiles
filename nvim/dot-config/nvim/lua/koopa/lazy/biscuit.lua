return {
	"code-biscuits/nvim-biscuits",

	event = { "BufReadPost", "BufNewFile" },

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},

	opts = {
		cursor_line_only = true,
		min_distance = 2,
	},
}
