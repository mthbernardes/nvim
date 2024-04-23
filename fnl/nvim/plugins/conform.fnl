(module nvim.plugins.conform
  {autoload {nvim aniseed.nvim}
   require {conform conform}})

(def formatfn """
  function()
  require('conform').format { async = true, lsp_fallback = true }
  end""")

(nvim.set_keymap :n :<leader>f formatfn {:noremap true})
