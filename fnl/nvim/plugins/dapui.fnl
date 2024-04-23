(module nvim.plugins.dapui
  {autoload {nvim aniseed.nvim
             dapui dapui
             dap dap}})

(dapui.setup {})

(nvim.set_keymap :n :<leader>ui ":lua require('dapui').toggle()<CR>" {})
