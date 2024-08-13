 -- Autoformat
 return {
   "stevearc/conform.nvim",
   lazy = false,
   keys = {
     {
       "<leader>f",
       function()
	 require("conform").format({ async = true, lsp_fallback = true})
       end,
       mode = "n",
       desc = "[F]ormat buffer",
     },
   },
   opts = {
     notify_on_error = true,
     format_on_save = function(bufnr)
       local disable_filetypes = { c = true, cpp = true }
       return {
	 timeout_ms = 500,
	 lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
       }
     end,
     formatters_by_ft = {
       lua = { "stylua" },
       -- Conform will run multiple formatters sequentially
       python = { "isort", "black" },
       -- Use a sub-list to run only the first available formatter
       javascript = { { "prettierd", "prettier" } },
     },
   },
 }
