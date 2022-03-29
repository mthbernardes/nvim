call plug#begin("~/.config/nvim/plugged")
  Plug 'Olical/aniseed'
  Plug 'Olical/fennel'
  Plug 'Olical/conjure'
call plug#end()

let g:aniseed#env = v:true
let g:deoplete#enable_at_startup = 1
