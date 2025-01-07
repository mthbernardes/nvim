-- lua/autocommands.lua
local M = {}

function M.setup()
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
end

return M
