return {
	'stevearc/conform.nvim',
	opts = {},
	-- Conform will run multiple formatters sequentially
	-- Use a sub-list to run only the first available formatter
	--
	-- { "stylua", "another" }
	-- - Runs both
	--
	-- { "stylua", { "prettierd", "prettier" } }
	--  - Runs stylua and one of the following two
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "eslint", { "prettierd", "prettier" } } },
		javascriptreact = { { "eslint", { "prettierd", "prettier" } } },
		jsx = { { "eslint", { "prettierd", "prettier" } } },
		react = { { "eslint", { "prettierd", "prettier" } } },
		ruby = { "rubocop" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	}
	-- setup = function()
	-- 	require("conform").setup({
	--
	--
	-- 	})
	-- end
}
