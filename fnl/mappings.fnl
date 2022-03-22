(module mappings
  {autoload {nvim aniseed.nvim}})

; navigate on splits
(nvim.set_keymap :n :<c-h> "<c-w>h" {:noremap true})
(nvim.set_keymap :n :<c-l> "<c-w>l" {:noremap true})
(nvim.set_keymap :n :<c-j> "<c-w>j" {:noremap true})
(nvim.set_keymap :n :<c-k> "<c-w>k" {:noremap true})
