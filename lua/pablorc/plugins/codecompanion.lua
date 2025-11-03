return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      -- Change the default chat adapter
      chat = {
        adapter = "anthropic",
      },

      adapters = {
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            model = "claude-sonnet-4-20250514",
            env = {
              api_key = "cmd:op echo $ANTHROPIC_API_KEY",
            },
          })
        end,
      },
    },
    opts = {
      -- Set debug logging
      -- log_level = "DEBUG",
    },
    -- config = function()
    --   require("codecompanion").setup({
    --     strategies = {
    --       chat = {
    --         adapter = "anthropic",
    --       },
    --       inline = {
    --         adapter = "anthropic",
    --       },
    --       cmd = {
    --         adapter = "anthropic",
    --       }
    --     },
    --   })
    -- end,
  },
}
