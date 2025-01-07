return {
  {
    "dmmulroy/ts-error-translator.nvim",
    lazy = true, -- Load plugin lazily
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" }, -- Load for relevant filetypes
    config = function()
      require("ts-error-translator").setup({
        auto_override_publish_diagnostics = false, -- Disable auto override
      })

      -- Override LSP Diagnostics manually
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx)
        require("ts-error-translator").translate_diagnostics(err, result, ctx)
        vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
      end
    end,
  },
}
