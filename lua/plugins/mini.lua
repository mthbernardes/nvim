return {
  "echasnovski/mini.nvim",
  config = function()
    -- Configure `mini.ai` (Enhanced Text Objects)
    require("mini.ai").setup({
      n_lines = 500, -- Number of surrounding lines to search for text objects
    })

    -- Configure `mini.surround` (Surround Editing)
    require("mini.surround").setup()

    -- Configure `mini.pairs` (Auto Pairs)
    require("mini.pairs").setup()

    -- Configure `mini.trailspace` (Highlight and Remove Trailing Whitespace)
    require("mini.trailspace").setup()

    -- Configure `mini.starter` (Startup Screen)
    require("mini.starter").setup({
      evaluate_single = true, -- Automatically open single available item
      items = {
	require("mini.starter").sections.recent_files(10, false),
	require("mini.starter").sections.builtin_actions(),
	{
	  name = "Edit Neovim Config",
	  action = "edit ~/.config/nvim/init.lua", -- Replace with your Neovim config path
	  section = "Config",
	},
	{
	  name = "Edit Plugin Configs",
	  action = "edit ~/.config/nvim/lua/plugins/init.lua", -- Adjust path as needed
	  section = "Config",
	},
	{
	  name = "Open Config Directory",
	  action = "edit ~/.config/nvim/", -- Open the whole config directory
	  section = "Config",
	},
      },
      content_hooks = {
	require("mini.starter").gen_hook.adding_bullet("• "), -- Add bullet points
	require("mini.starter").gen_hook.aligning("center", "center"), -- Center horizontally
	require("mini.starter").gen_hook.padding(5, 5), -- Add vertical padding to simulate vertical centering
      },
    })

    -- Configure `mini.move` (Move Text)
    require("mini.move").setup()

    -- Configure `mini.splitjoin` (Split and Join Arguments)
    require("mini.splitjoin").setup()
  end,
}
