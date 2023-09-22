return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
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
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(client)
									return client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
	-- config = function()
	-- 	require("mason").setup()
	-- 	require("mason-null-ls").setup({
	-- 		automatic_setup = true,
	-- 	})
	--
	-- 	local null_ls = require("null-ls")
	--
	-- 	null_ls.setup({
	-- 		sources = {
	-- 			null_ls.builtins.formatting.prettier,
	-- 			null_ls.builtins.formatting.stylua,
	-- 			--null_ls.builtins.completion.spell,
	-- 		},
	--
	-- 		ensure_installed = { "prettier" },
	-- 		automatic_installation = false,
	-- 	})
	-- end,
}
