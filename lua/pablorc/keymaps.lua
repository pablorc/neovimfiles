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

-- Range format
local range_formatting = function()
	local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
	local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
	vim.lsp.buf.format({
		range = {
			["start"] = { start_row, 0 },
			["end"] = { end_row, 0 },
		},
		async = true,
	})
end

vim.keymap.set("v", "<leader>FF", range_formatting, { desc = "Range Formatting" })
-- Range format END
