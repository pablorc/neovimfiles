return {

	-- Colorscheme
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		options = {},
		config = function()
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},

	-- Tree structure
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			config = function()
				require("neo-tree").setup({
					filesystem = {
						follow_current_file = false,
						-- This will find and focus the file in the active buffer every
						-- time the current file is changed while the tree is open.
					},
				})
			end,
		},
	},

	-- LSP-like for non-LSP stuff (i.e: prettier)
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			return {
				-- A list of sources to install if they're not already installed.
				-- This setting has no relation with the `automatic_installation` setting.
				ensure_installed = { "prettier" },
				-- Run `require("null-ls").setup`.
				-- Will automatically install masons tools based on selected sources in `null-ls`.
				-- Can also be an exclusion list.
				-- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
				automatic_installation = false,
			}
		end,
	},

	-- Undo tree
	{ "mbbill/undotree" },
	-- Toogle Term
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true, -- if no opts
		--opts = {}, -- if no config
	},
}
