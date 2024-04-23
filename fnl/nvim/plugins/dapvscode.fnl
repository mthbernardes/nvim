(module nvim.plugins.dapvscode)

(def dapvscode (require "dap-vscode-js"))

(dapvscode.setup {:adapters ["chrome" "pwa-node" "pwa-chrome" "pwa-msedge" "node-terminal" "pwa-extensionHost" "node" "chrome"]})
