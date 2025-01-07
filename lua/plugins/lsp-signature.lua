return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true, -- This is mandatory for LSP signature help
    hint_enable = true, -- Enable virtual hint
    floating_window = true, -- Use a floating window for signature help
    floating_window_above_cur_line = true, -- Try to place the floating window above the current line
    hint_prefix = "🔍 ", -- Prefix for parameter hints
    max_width = 80, -- Max width for the floating window
    max_height = 12, -- Max height for the floating window
    handler_opts = {
      border = "rounded", -- Border style: "none", "single", "double", "rounded", "shadow", "solid"
    },
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}
