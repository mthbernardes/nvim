(module nvim.mappings
  {autoload {nvim aniseed.nvim
             core aniseed.core
             }})

; configure keymappings
(set nvim.g.mapleader ",")
(set nvim.g.maplocalleader ",")

(set vim.opt.list true)
(set vim.opt.listchars {:tab "» " :trail "·" :nbsp "␣"})
(set vim.opt.scrolloff 10)
(set vim.opt.timeoutlen 300)
(set vim.opt.updatetime  250)

; navigate on splits
(nvim.set_keymap :n :<c-h> "<c-w>h" {:noremap true})
(nvim.set_keymap :n :<c-l> "<c-w>l" {:noremap true})
(nvim.set_keymap :n :<c-j> "<c-w>j" {:noremap true})
(nvim.set_keymap :n :<c-k> "<c-w>k" {:noremap true})

(nvim.set_keymap :n :<c-d> ":bd!<cr>" {:noremap true})
(nvim.set_keymap :n :<Esc> "<cmd>nohlsearch<CR>" {:noremap true})


