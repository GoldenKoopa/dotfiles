return {
	dir = "/home/koopa/dev/github/nimby_lsp/editors/neovim/",
	config = function(plugin)
		require("nimbyscript").setup({
			-- Optional: specify path to LSP binary
			-- cmd = "/path/to/nimbyscript-lsp",
		})
	end,
	ft = { "nimbyscript" },
}
