return {
  'nvim-tree/nvim-tree.lua',
  enabled = true,
  requires = 'nvim-tree/nvim-web-devicons',
  version = '*',
  lazy = false,
  config = function()
    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'

      -- Use default mappings, then override or extend them
      api.config.mappings.default_on_attach(bufnr)

      -- Custom key mappings
      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      vim.keymap.set('n', 'hs', api.node.open.horizontal, opts 'Open: Horizontal Split')
      vim.keymap.set('n', 'vs', api.node.open.vertical, opts 'Open: Vertical Split')
    end

    require('nvim-tree').setup {
      on_attach = my_on_attach,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      view = {
        width = 30,
        side = 'left',
      },
    }

    -- Global keybinding to toggle nvim-tree
    vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  end,
}
