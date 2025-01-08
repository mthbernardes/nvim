return {
  "echasnovski/mini.nvim",
  config = function()
    -- Configure `mini.ai` (Enhanced Text Objects)
    require("mini.ai").setup({
      n_lines = 500, -- Number of surrounding lines to search for text objects
    })

    -- Configure `mini.align` (Text Alignment)
    require("mini.align").setup()

    -- Configure `mini.surround` (Surround Editing)
    require("mini.surround").setup()

    -- Configure `mini.comment` (Comment Management)
    require("mini.comment").setup({
      hooks = {
        pre = function()
          -- Example: Add a custom action before commenting
        end,
        post = function()
          -- Example: Add a custom action after commenting
        end,
      },
    })

    -- Configure `mini.pairs` (Auto Pairs)
    require("mini.pairs").setup()

    -- Configure `mini.trailspace` (Highlight and Remove Trailing Whitespace)
    require("mini.trailspace").setup()


    -- Configure `mini.starter` (Startup Screen)
    require("mini.starter").setup({
      evaluate_single = true, -- Automatically open single available item
      items = {
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
	require("mini.starter").sections.recent_files(10, false),
	require("mini.starter").sections.builtin_actions()
      },
      content_hooks = {
	require("mini.starter").gen_hook.adding_bullet("• "), -- Add bullet points
	require("mini.starter").gen_hook.aligning("center", "center"),
      },
    })

    -- Configure `mini.move` (Move Text)
    require("mini.move").setup()

    -- Configure `mini.jump` (Enhanced Jump)
    require("mini.jump").setup({
      delay = { idle_stop = 500 }, -- Stop jump mode after 500ms of inactivity
    })

    -- Configure `mini.bufremove` (Buffer Management)
    require("mini.bufremove").setup()

    -- Configure `mini.cursorword` (Highlight Word Under Cursor)
    require("mini.cursorword").setup()

    -- Configure `mini.clue` (Keybinding Hints)
    require("mini.clue").setup({
      triggers = {
	{ mode = "n", keys = "<leader>" }, -- Show clues for <leader> key
	{ mode = "n", keys = "g" }, -- Show clues for 'g' key
      },
      clues = {
	{ mode = "n", keys = "<leader>w", desc = "Save file" },
	{ mode = "n", keys = "gd", desc = "Go to definition" },
      },
    })

    -- Configure `mini.fuzzy` (Fuzzy Finder)
    require("mini.fuzzy").setup({
      delay = 50, -- Delay in ms before showing results
    })

    -- Configure `mini.doc` (Auto Documentation)
    require("mini.doc").setup()

    -- Configure `mini.splitjoin` (Split and Join Arguments)
    require("mini.splitjoin").setup()
  end,
}
