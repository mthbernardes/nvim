(module nvim.plugins.golsp
  {autoload {lsp lspconfig
             configs lspconfig/configs}})

(let [config {:default_config {:cmd  ["golangci-lint-langserver"]
                               :init_options {:command ["golangci-lint" "run" "--enable-all" "--disable" "lll" "--allow-parallel-runners" "--issues-exit-code=1"]}}}] 
  (set configs.golangcilsp config)
  ;(set configs.golangci_lint_ls.setup {:filetypes ["go" "gomod"]})
  )


