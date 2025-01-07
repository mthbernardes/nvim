return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",  -- Python testing
      "nvim-neotest/neotest-jest",    -- JavaScript/TypeScript testing
      "rouge8/neotest-rust",          -- Rust testing
      "nvim-neotest/neotest-go",      -- Go testing
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
	adapters = {
	  require("neotest-python")({
	    dap = { justMyCode = false },
	  }),
	  require("neotest-jest")({
	    jestCommand = "npm test --",
	    env = { CI = true },
	  }),
	  require("neotest-rust"),
	  require("neotest-go"),
	},
	quickfix = {
	  open = false,
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

      vim.keymap.set("n", "<leader>td", function()
	neotest.run.run({ strategy = "dap" })
      end, { desc = "Debug nearest test" })
    end,
  },
  {
    -- Debug Adapter Protocol: nvim-dap
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",  -- UI for nvim-dap
      "jay-babu/mason-nvim-dap.nvim", -- Manage DAP installations
      "mfussenegger/nvim-dap-python", -- Python DAP
      "leoluz/nvim-dap-go",    -- Go DAP
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      require("mason-nvim-dap").setup({
	ensure_installed = { "python", "delve" }, -- Python and Go
      })

      -- Python Debugger
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

      -- Key mappings for DAP
      vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Continue Debugging" })
      vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Step Over" })
      vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Step Into" })
      vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "Step Out" })
      vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Set Conditional Breakpoint" })
      vim.keymap.set("n", "<Leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, { desc = "Set Log Point" })
      vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "Open REPL" })
      vim.keymap.set("n", "<Leader>dl", function() dap.run_last() end, { desc = "Run Last Debug Session" })

      -- Automatically open and close dap-ui
      dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
      end
    end,
  },
}
