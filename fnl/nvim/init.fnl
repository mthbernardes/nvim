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

                    ;lsp server
                    :neovim/nvim-lspconfig {:mod :lspconfig}
                    :williamboman/nvim-lsp-installer {:mod :nvim-lsp-installer}
                    :hrsh7th/cmp-nvim-lsp {:mod :cmp-nvim-lsp}
                    :hrsh7th/nvim-cmp {:mod :cmp}
                    :nvim-treesitter/nvim-treesitter {:mod :treesitter}

                    ; fuzzy finder
                    :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                                               :nvim-lua/plenary.nvim]
                                                    :mod :telescope}
                    ; jsx support
                    :leafgarland/typescript-vim {:mod :typescript-vim}
                    :peitalin/vim-jsx-typescript {:mod :vim-jsx-typescript}

                    ; git
                    :tpope/vim-fugitive {:mod :vim-fugitive}
                    :airblade/vim-gitgutter {:mod :gitgutter}

                    ; theme
                    :morhetz/gruvbox {:mod :gruvbox}

                    ; support nim
                    :zah/nim.vim {:mod :nim}

                    ; paredit-ish
                    :guns/vim-sexp {:mod :sexp}
                    :tpope/vim-sexp-mappings-for-regular-people {}
                    :tpope/vim-repeat {}
                    :tpope/vim-surround {}

                    ; phpactor
                    ;:phpactor/phpactor
                    ; auto-save
                    :907th/vim-auto-save {:mod :autosave}
                    ; rego
                    :tsandall/vim-rego {:mod :rego}

                    ;autoformat
                    :vim-autoformat/vim-autoformat {:mod :autoformat}

                    ; autocomplete
                    :Shougo/deoplete.nvim  {:mod :deoplete :run ":UpdateRemotePlugins"}
                    :tbodt/deoplete-tabnine {:mod :tabnine :run "./install.sh"}})

; theme
(theme.configure {:background :dark :colorscheme :gruvbox})
; configure language servers
(lsp.configure ["clojure_lsp" "tsserver" "bashls" "dockerls" "ltex" "pylsp" "html"  "rust_analyzer" "csharp_ls" "phpactor" "vimls" "golangci_lint_ls"])
    
