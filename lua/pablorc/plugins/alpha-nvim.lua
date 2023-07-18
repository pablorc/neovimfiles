return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("alpha").setup(require("pablorc.alpha-themes.fine").config)
	end,
}
