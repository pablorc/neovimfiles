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
vim.keymap.set("n", "<leader>ts", function()
	vim.cmd(":Neotree")
end, { desc = "[T]ree [S]how Sidebar" })

vim.keymap.set("n", "<leader>tf", function()
	vim.cmd(":Neotree")
end, { desc = "[T]ree [F]loat Sidebar" })

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })

-- Open diagnostic in a float window
-- (i.e: the message is too long for reading it in-line)
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", {
	noremap = true,
	silent = true,
	desc = "[D]iagnostic [O]pen in float window",
})

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {
	desc = "[U]ndotree",
})