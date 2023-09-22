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
vim.keymap.set("n", "<leader>ds", "<cmd>lua vim.diagnostic.open_float()<CR>", {
	noremap = true,
	silent = true,
	desc = "[D]iagnostic [S]how",
})

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {
	desc = "[U]ndotree",
})

vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<cr>", { desc = "<C-f> tmux-sessionizer" })
