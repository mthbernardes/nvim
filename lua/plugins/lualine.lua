return {
  'nvim-lualine/lualine.nvim',
  config=function()
    require("lualine").setup({
      extesions = {"lazy","nvim-tree","mason","quickfix"},
      sections = {
	lualine_c = {
	  {
	    'filename',
	    path = 1
	  },
	  {
	    'diagnostics',
	    sources = { 'nvim_diagnostic', 'coc' },
	    sections = { 'error', 'warn', 'info', 'hint' },
	    diagnostics_color = {
	      error = 'DiagnosticError',
	      warn  = 'DiagnosticWarn',
	      info  = 'DiagnosticInfo',
	      hint  = 'DiagnosticHint',
	    },
	    symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
	    colored = true,
	    update_in_insert = false,
	    always_visible = false,
	  }
	}
      }
    })
  end

}
