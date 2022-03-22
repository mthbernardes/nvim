(module plugins.lspconfig
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             cmplsp cmp_nvim_lsp
             core aniseed.core}})

(defn- define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
    (vim.fn.sign_define error {:text "x" :texthl error})
    (vim.fn.sign_define warn  {:text "!" :texthl warn})
    (vim.fn.sign_define info  {:text "i" :texthl info})
    (vim.fn.sign_define hint  {:text "?" :texthl hint})))

(if (= (nvim.fn.has "nvim-0.6") 1)
  (define-signs "Diagnostic")
  (define-signs "LspDiagnostics"))

(def- handlers {"textDocument/publishDiagnostics" (vim.lsp.with
                                                    vim.lsp.diagnostic.on_publish_diagnostics
                                                    {:severity_sort true
                                                     :update_in_insert false
                                                     :underline true
                                                     :virtual_text false})
                "textDocument/hover" (vim.lsp.with
                                       vim.lsp.handlers.hover
                                       {:border "single"})
                "textDocument/signatureHelp" (vim.lsp.with
                                               vim.lsp.handlers.signature_help
                                               {:border "single"})})

(def- capabilities (cmplsp.update_capabilities (vim.lsp.protocol.make_client_capabilities)))

(defn- on-attach [client bufnr] 
  (let [opts {:noremap true :silent true }]
    (nvim.buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :=G "<cmd>lua vim.lsp.buf.formatting()<CR>" {:noremap true})))

(defn configure [servers]
  (each [_ server (pairs servers)]
    (let [opts {:on_attach on-attach :handlers handlers :capabilities capabilities}
          server-setup-fn (-> lsp (. server) (. "setup"))]
      (server-setup-fn opts))))
