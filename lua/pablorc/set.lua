vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 10

vim.opt.colorcolumn = "80"

vim.wo.relativenumber = true

vim.opt.cursorline = true

vim.opt.signcolumn = "yes"

-- Neovim 0.12 snap packaging: bundled Lua parser lacks the "operator" field
-- that the runtime queries expect, causing errors whenever a Lua buffer is loaded.
-- Wrap vim.treesitter.start to suppress those errors until the snap is updated.
local _orig_ts_start = vim.treesitter.start
vim.treesitter.start = function(bufnr, lang)
  pcall(_orig_ts_start, bufnr, lang)
end
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.lsp.start {
      name = "rubocop",
      cmd = { "bundle", "exec", "rubocop", "--lsp" },
    }
  end,
})


