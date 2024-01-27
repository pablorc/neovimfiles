return {
  "folke/tokyonight.nvim",
  priority = 1000,
  lazy = false,
  options = {},
  config = function()
    vim.cmd.colorscheme("tokyonight-storm")
  end,
}
