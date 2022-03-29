(module nvim.plugins.nerdtree
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(nvim.set_keymap :n :<c-t> ":NERDTreeToggleVCS <cr>" {:noremap true})
