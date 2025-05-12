local M = {}

-- Setup autocommands
function M.setup()
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.hl.on_yank()
    end,
  })

  -- vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI', 'TextChangedP' }, {
  --   desc = 'Auto save on change',
  --   group = vim.api.nvim_create_augroup('kickstart-auto-save', { clear = true }),
  --   callback = function()
  --     if vim.bo.buftype == '' then
  --       vim.cmd 'write'
  --     end
  --   end,
  -- })
end

-- Reload configuration function
-- function M.reload_config()
-- 	-- Clear all user-defined Lua modules
-- 	for name, _ in pairs(package.loaded) do
-- 		if name:match("^plugins") or name:match("^mappings") or name:match("^autocommands") then
-- 			package.loaded[name] = nil
-- 		end
-- 	end

--	-- Reload user modules
--	dofile(vim.fn.stdpath("config") .. "/lua/mappings/globals.lua")
--	dofile(vim.fn.stdpath("config") .. "/lua/mappings/opt.lua")
--	dofile(vim.fn.stdpath("config") .. "/lua/mappings/keys.lua")
--	dofile(vim.fn.stdpath("config") .. "/lua/plugins/init.lua")
--
--	print("Configuration reloaded without warnings!")
-- end

-- Create a user command for reloading config
-- vim.api.nvim_create_user_command("ReloadConfig", M.reload_config, { desc = "Reload Neovim configuration" })

return M
