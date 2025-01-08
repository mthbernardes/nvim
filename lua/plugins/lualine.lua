return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require("lualine").setup({
      options = {
	theme = 'auto', -- Automatically adapt to your colorscheme
	section_separators = '', -- Remove separators for a cleaner look
	component_separators = '',
      },
      extensions = { "lazy", "nvim-tree", "mason", "quickfix" }, -- Fixed typo
      sections = {
	lualine_a = { 'mode' }, -- Show current mode (e.g., INSERT, NORMAL)
	lualine_b = { 'branch', 'diff' }, -- Git branch and diff status
	lualine_c = {
	  {
	    'filename',
	    path = 1, -- Show the relative path to the file
	  },
	  {
	    'diagnostics',
	    sources = { 'nvim_diagnostic' }, -- Use 'nvim_diagnostic' for built-in diagnostics
	    sections = { 'error', 'warn', 'info', 'hint' }, -- Show all diagnostic sections
	    diagnostics_color = {
	      error = { fg = '#F44747' }, -- Define colors for diagnostics
	      warn  = { fg = '#FF8800' },
	      info  = { fg = '#4FC1FF' },
	      hint  = { fg = '#10B981' },
	    },
	    symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' }, -- Add symbols
	    colored = true, -- Enable coloring of diagnostics
	    update_in_insert = false, -- Do not update diagnostics in insert mode
	    always_visible = false, -- Hide diagnostics if there are none
	  },
	},
	lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- File-related info
	lualine_y = { 'progress' }, -- Show progress (percentage through file)
	lualine_z = { 'location' }, -- Show line and column number
      },
    })
  end,
}
