return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = false,
          -- This will find and focus the file in the active buffer every
          -- time the current file is changed while the tree is open.
        },
      })
    end,
  },
}
