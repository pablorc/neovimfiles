return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      view = {
        merge_tool = {
          layout = "diff4_mixed",
          -- disable_diagnostics = true
        }
      }
    })
  end
}
