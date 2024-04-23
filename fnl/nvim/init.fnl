(module nvim.init
  {autoload {core aniseed.core 
             nvim aniseed.nvim 
             config nvim.config 
             lsp nvim.plugins.lspconfig
             plugins nvim.plugins
             theme nvim.plugins.theme}
   require {mappings nvim.mappings}})


;configure nvim global options
(config.set-general-options {:completeopt "menuone,noselect" 
                             :ignorecase true 
                             :smartcase true 
                             :clipboard "unnamedplus"
                             :hidden true 
                             :number true 
                             :inccommand "split" 
                             :expandtab true
                             :shiftwidth 2 
                             :softtabstop 2
                             :ts 2
                             :sw 2
                             :sts 0
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

                    ; autoformat
                    :stevearc/conform.nvim {:mod :conform}

                    ;lsp server
                    :hrsh7th/cmp-nvim-lsp {:mod :cmp-nvim-lsp}
                    :hrsh7th/nvim-cmp {:mod :cmp}
                    :williamboman/mason.nvim {:mod :mason}
                    :williamboman/mason-lspconfig.nvim {:mod :mason-lspconfig}
                    :neovim/nvim-lspconfig {:mod :lspconfig}
                    :nvim-treesitter/nvim-treesitter {:mod :treesitter}

                    ; fuzzy finder
                    :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                                               :nvim-lua/plenary.nvim]
                                                    :mod :telescope}

                    ; mini
                    :echasnovski/mini.nvim {:mod :mini}

                    ; theme
                    :morhetz/gruvbox {:mod :gruvbox}
                    ; lsp-client-view
                    :j-hui/fidget.nvim {:mod :fidget}

                    ; paredit-ish
                    :guns/vim-sexp {:mod :sexp}
                    :tpope/vim-sexp-mappings-for-regular-people {}
                    :tpope/vim-repeat {}
                    :tpope/vim-surround {}

                    ; auto-save
                    :907th/vim-auto-save {:mod :autosave}

                    ; autoformat
                    :vim-autoformat/vim-autoformat {:mod :autoformat}

                    :almo7aya/openingh.nvim {:mod :openingh}

                    ; autocomplete
                    :Shougo/deoplete.nvim  {:mod :deoplete :run ":UpdateRemotePlugins"}})

; theme
(theme.configure {:background :dark :colorscheme :gruvbox})

; configure language servers
(def lsp-servers ["clojure_lsp" "tsserver" "bashls" "dockerls" "ltex" "pylsp" "html"  "rust_analyzer" "csharp_ls" "phpactor" "vimls" "golangci_lint_ls" "terraformls" "fennel-language-server"])
(lsp.configure lsp-servers)

