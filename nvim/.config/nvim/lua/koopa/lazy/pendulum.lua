return {
	"ptdewey/pendulum-nvim",
	config = function()
		require("pendulum").setup({
            time_zone = "Europe/Berlin",
            time_format = "24h",
        })
	end,
}
