-- -- null-ls
-- require("mason").setup()
-- require("mason-null-ls").setup({
-- 	automatic_setup = true,
-- })

-- local null_ls = require("null-ls")
--
-- null_ls.setup({
-- 	sources = {
-- 		null_ls.builtins.formatting.prettier,
-- 		null_ls.builtins.formatting.stylua,
-- 		--null_ls.builtins.completion.spell,
-- 	},
-- })

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

vim.g.diagnostics_active = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.lsp.diagnostic.clear(0)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
  else
    vim.g.diagnostics_active = true
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    })
  end
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>dh",
  ":call v:lua.toggle_diagnostics()<CR>",
  { noremap = true, silent = true, desc = "[D]iagnostics [H]ide" }
)

-- Add a vim mapping to run the sequence ]m when typing F5m
vim.api.nvim_set_keymap("n", "<F5>", "]", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F4>", "[", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F4>", "[", { noremap = true, silent = true })
