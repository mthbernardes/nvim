require 'mappings.globals'
require 'mappings.opt'
require 'mappings.keys'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI', 'TextChangedP' }, {
  desc = 'Auto save on change',
  group = vim.api.nvim_create_augroup('kickstart-auto-save', { clear = true }),
  callback = function()
    if vim.bo.buftype == '' then
      vim.cmd 'write'
    end
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--  callback = function()
--    require("lint").try_lint()
--  end,
--})

if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'plugins.nvim-lint',
  require 'plugins.nvim-web-devicons',
  require 'plugins.openingh',
  require 'plugins.gitsigns',
  require 'plugins.vim-test',
  require 'plugins.nvim-tree',
  require 'plugins.telescope',
  require 'plugins.nvim-lspconfig',
  require 'plugins.nvim-cmp',
  require 'plugins.lsp-signature',
  require 'plugins.git-conflict',
  require 'plugins.tokyonight',
  require 'plugins.todo-comments',
  require 'plugins.mini',
  require 'plugins.nvim-treesitter',
  require 'plugins.lualine',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
