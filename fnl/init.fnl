(module init
  {autoload {core aniseed.core 
             nvim aniseed.nvim
             config config
             plugins plugins
             lsp plugins.lspconfig}})

; configure nvim global options
(config.set-general-options {:completeopt "menuone,noselect" 
                             :ignorecase true 
                             :smartcase true 
                             :clipboard "unnamedplus"
                             :hidden true 
                             :number true 
                             :inccommand "split" 
                             :tabstop 2 
                             :shiftwidth 2 
                             :expandtab true
                             :undofile true 
                             :wmw 0 
                             :modifiable true})

; configure nvim plugins
(plugins.configure {; basic setup to use fennel
                    :Olical/aniseed {:mod :aniseed}
                    :Olical/fennel  {:mod :fennel}                   
                    :Olical/conjure {:mod :conjure}                   

                    ; fuzzy finder
                    :nvim-lua/plenary.nvim {:mod :plenary}
                    :nvim-telescope/telescope.nvim  {:mod :telescope}

                    ; theme
                    :morhetz/gruvbox {:mod :gruvbox}

                    ;lsp server
                    :neovim/nvim-lspconfig {:mod :lspconfig}
                    :hrsh7th/nvim-cmp {:mod :nvim-cmp}
                    :nvim-treesitter/nvim-treesitter {:mod :treesitter}})

; configure language servers
(lsp.configure ["clojure_lsp" "tsserver"])

; configure keymappings
(set nvim.g.maplocalleader ",")
(nvim.set_keymap :n :<c-n>":bn<cr>" {:noremap true})
(nvim.set_keymap :n :<c-d>":bd!<cr>" {:noremap true})

; theme
(set nvim.o.background :dark)
(nvim.command "colorscheme gruvbox")
