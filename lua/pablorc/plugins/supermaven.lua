-- return {
--   "Exafunction/codeium.vim",
--   event = "BufEnter",
-- }
return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
}
