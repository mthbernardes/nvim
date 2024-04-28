return {
  "nvim-tree/nvim-tree.lua",
  enabled = true,
  requires = "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-tree").setup({
      auto_close = true, -- Deprecated in newer versions: consider using setup options as per latest docs
      update_focused_file = {
	enable = true,
	update_cwd = true,
      },
      view = {
	width = 30,
	side = "left",
      },
    })
    vim.api.nvim_set_keymap("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  end,
}
