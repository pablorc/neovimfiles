return {
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
}
