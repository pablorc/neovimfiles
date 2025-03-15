-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   lazy = false,
--   options = {},
--   config = function()
--     vim.cmd.colorscheme("tokyonight-storm")
--   end,
-- }

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
