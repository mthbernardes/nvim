local function reload_config()
  -- Clear all user-defined Lua modules
  for name, _ in pairs(package.loaded) do
    if name:match("^plugins") or name:match("^mappings") or name:match("^autocommands") then
      package.loaded[name] = nil
    end
  end

  -- Reload only user modules
  dofile(vim.fn.stdpath("config") .. "/lua/mappings/globals.lua")
  dofile(vim.fn.stdpath("config") .. "/lua/mappings/opt.lua")
  dofile(vim.fn.stdpath("config") .. "/lua/mappings/keys.lua")
  dofile(vim.fn.stdpath("config") .. "/lua/autocommands.lua")

  -- Optional: Reload specific plugin configs
  dofile(vim.fn.stdpath("config") .. "/lua/plugins/init.lua")

  -- Reload Lazy.nvim plugin configuration
  require("lazy").setup("plugins")

  print("Configuration reloaded without warnings!")
end

-- Define the ReloadConfig command
vim.api.nvim_create_user_command("ReloadConfig", reload_config, {})
