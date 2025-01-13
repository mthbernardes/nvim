return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-jest", -- JavaScript/TypeScript testing
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            env = { CI = true },
          }),
        },
        quickfix = {
          open = true,
        },
        floating = {
          border = "rounded",
          max_height = 0.8,
          max_width = 0.8,
        },
        output = {
          enabled = true,
          open_on_run = "short",
        },
        summary = {
          mappings = {
            expand = "<CR>",
            output = "o",
            run = "r",
            stop = "s",
          },
        },
      })

      -- Key mappings for Neotest
      vim.keymap.set("n", "<leader>tn", function()
        neotest.run.run()
      end, { desc = "Run nearest test" })

      vim.keymap.set("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
      end, { desc = "Run all tests in file" })

      vim.keymap.set("n", "<leader>ts", function()
        neotest.summary.toggle()
      end, { desc = "Toggle test summary window" })

      vim.keymap.set("n", "<leader>to", function()
        neotest.output.open({ enter = true })
      end, { desc = "Open test output" })
    end
  }
}
