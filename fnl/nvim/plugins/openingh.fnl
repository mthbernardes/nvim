(module nvim.plugins.openingh
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<Leader>og":OpenInGHFileLines <CR>" {:noremap true :silent true})
