(module init
  {autoload {core aniseed.core 
             nvim aniseed.nvim config config
             plugins plugins
             theme plugins.theme
             lsp plugins.lspconfig}
   require {mappings mappings}})

;configure nvim global options
(config.set-general-options {:completeopt "menuone,noselect" :ignorecase true :smartcase true 
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

                    ; file tree
                    :preservim/nerdtree {:mod :nerdtree}

                    ; fuzzy finder
                    :nvim-lua/plenary.nvim {:mod :plenary}
                    :nvim-telescope/telescope.nvim  {:mod :telescope}

                    ; theme
                    :morhetz/gruvbox {:mod :gruvbox}

                    ; paredit-ish
                    :guns/vim-sexp {:mod :sexp}

                    ; autocomplete
                    ;:Shougo/deoplete.nvim  {:mod :deoplete :config {"do" ":UpdateRemotePlugins"}}
                    ;:tbodt/deoplete-tabnine {:mod :tabnine :config {"do" "./install.sh"}}

                    ;lsp server
                    :neovim/nvim-lspconfig {:mod :lspconfig}
                    :hrsh7th/nvim-cmp {:mod :cmp}
                    :nvim-treesitter/nvim-treesitter {:mod :treesitter}})

; theme
(theme.configure {:background :dark :colorscheme :gruvbox})

; configure language servers
(lsp.configure ["clojure_lsp" "tsserver" "bashls" "dockerls"])
