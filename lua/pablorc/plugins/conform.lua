local prettier = { "prettierd", "prettier" }

return {
  "stevearc/conform.nvim",
  -- event = { "BufWritePre", "BufNewFile" },
  -- cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")

    conform.setup({
      -- Conform will run multiple formatters sequentially
      -- Use a sub-list to run only the first available formatter
      --
      -- { "stylua", "another" }
      -- - Runs both
      --
      -- { "stylua", { "prettierd", "prettier" } }
      --  - Runs stylua and one of the following two
      formatters_by_ft = {
        lua = { "stylua" },
        ruby = { "rubocop" },

        css = { prettier },
        graphql = { prettier },
        handlebars = { prettier },
        html = { prettier },
        javascript = { prettier },
        javascriptreact = { prettier },
        json = { prettier },
        jsonc = { prettier },
        jsx = { prettier },
        markdown = { prettier },
        react = { prettier },
        scss = { prettier },
        typescript = { prettier },
        typescriptreact = { prettier },
        yaml = { prettier },
      },

      format_on_save = {
        -- These options will be passed to conform.format()
        async = false,
        timeout_ms = 50000,
        lsp_fallback = true,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format({
        async = false,
        timeout_ms = 50000,
        lsp_fallback = true,
      })
    end, { desc = "[C]onform [F]ormat" })
  end,
}
