local prettier = { "prettierd", "prettier" }

return {
	"stevearc/conform.nvim",
	opts = {
		-- Conform will run multiple formatters sequentially
		-- Use a sub-list to run only the first available formatter
		--
		-- { "stylua", "another" }
		-- - Runs both
		--
		-- { "stylua", prettier }
		--  - Runs stylua and one of the following two
		formatters_by_ft = {
			lua = { "stylua" },
			-- ruby = { "rubocop" },

			javascript = { prettier },
			javascriptreact = { prettier },
			jsx = { prettier },
			react = { prettier },
			css = { prettier },
			scss = { prettier },
			html = { prettier },
			json = { prettier },
			jsonc = { prettier },
			yaml = { prettier },
			markdown = { prettier },
			graphql = { prettier },
			handlebars = { prettier },
		},

		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
