-- configure test integration

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-jest",
    "mfussenegger/nvim-dap",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<space>tr",
      function()
	require("neotest").watch.toggle(vim.fn.expand("%"))
	require("neotest").run.run({ vim.fn.expand("%") })
      end,
      mode = "n",
      desc = "[T]est [R]un",
    },
    {
      "<space>to",
      function()
	require("neotest").summary.toggle()
      end,
      mode = "n",
      desc = "[T]est [O]pen",
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
	require("neotest-jest")({
	  jestCommand = "npm test --",
	  cwd = function(path)
	    return vim.fn.getcwd()
	  end,
	}),
      },
    })
  end,
}
