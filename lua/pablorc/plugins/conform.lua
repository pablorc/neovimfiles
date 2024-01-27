local prettier = { "prettierd", "prettier" }

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
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

			css = { prettier },
			graphql = { prettier },
			handlebars = { prettier },
			html = { prettier },
			javascript = { prettier },
			javascriptreact = { prettier },
			json = { prettier },
			jsonc = { prettier },
			jsx = { prettier },
			markdown = { prettier },
			react = { prettier },
			scss = { prettier },
			yaml = { prettier },
		},

		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
