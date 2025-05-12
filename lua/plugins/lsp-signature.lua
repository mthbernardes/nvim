return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true,
    hint_enable = true,
    floating_window = true,
    floating_window_above_cur_line = true,
    hint_prefix = "🔍 ",
    max_width = 80,
    max_height = 12,
    handler_opts = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    local signature = require("lsp_signature")
    opts.on_attach = function(client, bufnr)
      -- Only attach if the client supports signature help
      if client.server_capabilities.signatureHelpProvider then
        local encoding = client.offset_encoding or "utf-16"
        signature.on_attach(opts, bufnr)
      end
    end
    signature.setup(opts)
    -- Do not override the global handler - this causes conflicts
    -- Instead let the on_attach handle it per-buffer
  end,
}
