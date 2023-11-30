return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		'nvim-lua/plenary.nvim',
		'joechrisellis/lsp-format-modifications.nvim',
	},
	config = function()
		-- require"lsp-format-modifications".format_modifications(<lsp-client>, <bufnr>, <config>)
		local null_ls = require("null-ls")
		local lSsources = {
			null_ls.builtins.formatting.prettier.with({
				filetypes = {
					"javascript",
					"typescript",
					"css",
					"scss",
					"html",
					"json",
					"yaml",
					"markdown",
					"graphql",
					"md",
					"txt",
				},
			}),
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		require("null-ls").setup({
			sources = lSsources,
			on_attach = function(client, bufnr)
				local lsp_format_modifications = require("lsp-format-modifications")
				lsp_format_modifications.attach(client, bufnr, { format_on_save = true })
			end,
		})
	end,
}
