(module nvim.plugins.dapnvim
  {autoload {nvim aniseed.nvim}})

(def DAP (require "dap"))
(def DAPUTILS (require "dap.utils"))
(def FUNCTIONBREAKPOINT """:lua function()
require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end""")

(nvim.set_keymap :n :<F5> ":lua require('dap').continue()<CR>" {})
(nvim.set_keymap :n :<F10> ":lua require('dap').step_over()<CR>" {})
(nvim.set_keymap :n :<F11> ":lua require('dap').step_into()<CR>" {})
(nvim.set_keymap :n :<F12> ":lua require('dap').step_out()<CR>" {})
(nvim.set_keymap :n :<leader>b FUNCTIONBREAKPOINT {})

(def config [
             {
              :type "pwa-node"
              :request "launch"
              :name "Launch file"
              :program "${file}"
              :cwd "${workspaceFolder}"
              }
             {
              :type "pwa-node"
              :request "attach"
              :name "Attach"
              :processId (DAPUTILS.pick_process)
              :cwd "${workspaceFolder}"
              }
             {
              :type "pwa-chrome"
              :request "launch"
              :name "Start Chrome with \"localhost\""
              :url "http://localhost:3000"
              :webRoot "${workspaceFolder}"
              :userDataDir "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
              }
             ]
  )

(set DAP.configurations.typescript config)
(set DAP.configurations.javascript config)
(set DAP.configurations.typescriptreact config)
