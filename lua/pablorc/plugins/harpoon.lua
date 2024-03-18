return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- Harpoon docs does no add parameters
    ---@diagnostic disable-next-line: missing-parameter
    harpoon:setup()

    -- basic telescope configuration
    -- local conf = require("telescope.config").values
    -- local function toggle_telescope(harpoon_files)
    --   local file_paths = {}
    --   for _, item in ipairs(harpoon_files.items) do
    --     table.insert(file_paths, item.value)
    --   end
    --
    --   require("telescope.pickers")
    --     .new({}, {
    --       prompt_title = "Harpoon",
    --       finder = require("telescope.finders").new_table({
    --         results = file_paths,
    --       }),
    --       previewer = conf.file_previewer({}),
    --       sorter = conf.generic_sorter({}),
    --     })
    --     :find()
    -- end
    --
    -- Mappings
    vim.keymap.set("n", "<leader><space>", function()
      -- toggle_telescope(harpoon:list())
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open harpoon window" })

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():append()
    end)

    -- vim.keymap.set("n", "<leader>A", function()
    --   harpoon:list()
    -- end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<tab>", function()
      harpoon:list():next()
    end)
    vim.keymap.set("n", "<S-tab>", function()
      harpoon:list():prev()
    end)

    -- Fast access to the first 4 harpoon buffers
    vim.keymap.set("n", "<C-h>", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<C-j>", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<C-k>", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<C-l>", function()
      harpoon:list():select(4)
    end)
  end,
}
