(module nvim.plugins.autoformat
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<c-s> ":Autoformat<cr>" {:noremap true})

(set nvim.g.autoformat_autoindent 0)
(set nvim.g.autoformat_retab 0)
(set nvim.g.autoformat_remove_trailing_spaces 0)
