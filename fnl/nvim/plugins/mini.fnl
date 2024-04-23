(module nvim.plugins.mini
  {autoload {nvim aniseed.nvim}
   require {statusline mini.statusline}})

(statusline.setup {:use_icons vim.g.have_nerd_font})
