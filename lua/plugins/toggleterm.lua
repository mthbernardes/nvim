return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\>]], -- Keybinding to toggle terminal
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true, -- Open terminal in insert mode
      terminal_mappings = true,
      persist_size = true,
      direction = "float", -- Open terminal in floating mode
      close_on_exit = true,
      shell = vim.o.shell, -- Use the default shell
      float_opts = {
	border = "rounded",
	winblend = 0,
	highlights = {
	  border = "Normal",
	  background = "Normal",
	},
      },
    })

    -- Key mapping for shell
    vim.keymap.set("n", "<leader>sh", function()
      require("toggleterm.terminal").Terminal:new({ hidden = true }):toggle()
    end, { desc = "Open floating shell" })
  end,
}
