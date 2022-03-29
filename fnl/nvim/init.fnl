(module nvim.init
  {autoload {core aniseed.core 
             nvim aniseed.nvim 
             config nvim.config 
             lsp nvim.plugins.lspconfig
             plugins nvim.plugins
             theme nvim.plugins.theme}
   require {mappings nvim.mappings}})

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
(plugins.configure {; plugin manager
                    :wbthomason/packer.nvim {}
                    ; basic setup to use fennel
                    :Olical/aniseed {:branch :develop}
                    :Olical/fennel  {:mod :fennel}                   
                    :Olical/conjure {:branch :master :mod :conjure}

                    ; file tree
                    :preservim/nerdtree {:mod :nerdtree}

                    ; fuzzy finder
                    :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                                               :nvim-lua/plenary.nvim]
                                                    :mod :telescope}

                    ; theme
                    :morhetz/gruvbox {:mod :gruvbox}

                    ; paredit-ish
                    :guns/vim-sexp {:mod :sexp}

                    ; autocomplete
                    ;:Shougo/deoplete.nvim  {:mod :deoplete :config {"do" ":UpdateRemotePlugins"}}
                    ;:tbodt/deoplete-tabnine {:mod :tabnine :config {"do" "./install.sh"}}

                    ;lsp server
                    :neovim/nvim-lspconfig {:mod :lspconfig}
                    :hrsh7th/cmp-nvim-lsp {:mod :cmp-nvim-lsp}
                    :hrsh7th/nvim-cmp {:mod :cmp}
                    :nvim-treesitter/nvim-treesitter {:mod :treesitter}})

; theme
(theme.configure {:background :dark :colorscheme :gruvbox})

; configure language servers
(lsp.configure ["clojure_lsp" "tsserver" "bashls" "dockerls"])

