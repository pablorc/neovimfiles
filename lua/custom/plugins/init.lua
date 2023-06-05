return {

	-- Colorscheme
	{
		'folke/tokyonight.nvim',
		priority = 1000,
		lazy = false,
		options = {},
		config = function()
			vim.cmd.colorscheme 'tokyonight-storm'
		end,
	},

	-- Tree structure
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	},
}
