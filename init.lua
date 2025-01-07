require('mappings.globals')
require('mappings.opt')
require('mappings.keys')
require('autocommands').setup()

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local icons = vim.g.have_nerd_font and {} or {
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
}

require('lazy').setup(require('plugins'), { ui = { icons = icons } })
