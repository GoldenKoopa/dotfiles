return {
	dir = "~/dev/github/header.nvim",
	config = function()
		require("header").setup({
            author_from_git = true,
            license_from_file = true,
        })
	end,
}
