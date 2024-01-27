return {
  "levouh/tint.nvim",
  config = function()
    require("tint").setup({
      tint = -55, -- Darken colors, use a positive value to brighten
      saturation = 0.6,
    })
  end,
}
