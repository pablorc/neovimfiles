local prettier = { "prettierd", "prettier" }

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
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

      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return { timeout_ms = 500, lsp_fallback = true, async = false }
      end,
    })

    -- Keymaps
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format({
        async = false,
        timeout_ms = 50000,
        lsp_fallback = true,
      })
    end, { desc = "[C]onform [F]ormat" })

    -- Toggle formatting
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end,
}
