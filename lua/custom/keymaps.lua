-- null-ls
require("mason").setup()
require("mason-null-ls").setup({
	automatic_setup = true,
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
		--null_ls.builtins.completion.spell,
	},
})

-- Neotree
vim.keymap.set('n', '<leader>ts', function() vim.cmd(":Neotree") end, { desc = '[T]ree [S]how Sidebar' })

-- Fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
