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

vim.keymap.set("n", "<C-p>", ":silent !tmux display-popup -E tmux-sessionizer<cr>", { desc = "<C-n> tmux-sessionizer" })
-- vim.keymap.set("n", "<C-s-p>", ":silent !tmux display-popup -E tmux-switch<cr>", { desc = "<C-p> tmux-switch" })

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

vim.keymap.set("n", "<leader>yf", function()
  local file = vim.fn.expand("%:t")

  vim.fn.setreg("+", file)
end, { desc = "[Y]ank [F]ilename" })

vim.keymap.set("n", "<leader>yp", function()
  local file = vim.fn.expand("%")

  vim.fn.setreg("+", file)
end, { desc = "[Y]ank [P]ath" })

vim.keymap.set("n", "<leader>ya", function()
  local path = vim.fn.expand("%:p")

  -- Replace $HOME with ~
  -- path = path:gsub(os.getenv("HOME") or "", "~")

  vim.fn.setreg("+", path)
end, { desc = "[Y]ank [A]bsolute path" })

vim.keymap.set("n", "<leader>$", ":silent !tmux display-popup<cr>", { desc = "<leader>$ Open shell on popup" })

-- vim.keymap.set("n", "<leader>$", function()
--   require("yeet").list_cmd()
-- end, { desc = "Yeet execute" })
--
-- vim.keymap.set("n", "<leader>yt", function()
--   require("yeet").select_target()
-- end, { desc = "[Y]eet Choose [T]arget" })

-- vim.keymap.set("n", "<leader>yo", function()
--   require("yeet").toggle_post_write()
-- end, { desc = "[Y]eet [O]n/Off" })
--
-- vim.keymap.set("n", "<leader>yl", function()
--   require("yeet").execute()
-- end, { desc = "[Y]eet This [L]ine" })
