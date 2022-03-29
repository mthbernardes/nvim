(module nvim.plugins.vim-fugitive
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>gs ":Git <CR>" {:noremap true})

