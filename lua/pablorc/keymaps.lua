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

-- NeoTree
vim.keymap.set("n", "<leader>fs", function()
	vim.cmd(":Neotree toggle position=left reveal=true")
end, { desc = "[F]iletree [S]how Sidebar" })

vim.keymap.set("n", "<leader>ff", function()
	vim.cmd(":Neotree toggle position=float reveal=true")
end, { desc = "[F]iletree [F]loat Sidebar" })

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

-- Toogle term
vim.keymap.set("n", "<leader>td", function()
	vim.cmd(":ToggleTerm direction=horizontal")
end, {
	desc = "[T]erminal [D]own",
})
vim.keymap.set("n", "<leader>tf", function()
	vim.cmd(":ToggleTerm direction=float")
end, {
	desc = "[T]erminal [F]loat",
})
vim.keymap.set("n", "<leader>tt", function()
	vim.cmd(":ToggleTerm direction=float")
end, {
	desc = "[T]erminal [T]oggle Float",
})
vim.keymap.set("n", "<leader>tc", function()
	vim.cmd(":TermExec cmd='chat' direction=float")
end, {
	desc = "[T]erminal [C]hat Float",
})
--
-- Map <ESC> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
