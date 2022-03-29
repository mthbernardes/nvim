(module nvim.mappings
  {autoload {nvim aniseed.nvim}})

; configure keymappings
(set nvim.g.maplocalleader ",")

; navigate on splits
(nvim.set_keymap :n :<c-h> "<c-w>h" {:noremap true})
(nvim.set_keymap :n :<c-l> "<c-w>l" {:noremap true})
(nvim.set_keymap :n :<c-j> "<c-w>j" {:noremap true})
(nvim.set_keymap :n :<c-k> "<c-w>k" {:noremap true})

(nvim.set_keymap :n :<c-d> ":bd!<cr>" {:noremap true})
