(module nvim.plugins.theme
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(defn configure [options]
  (set nvim.o.background (. options :background))
  (nvim.command (core.str "colorscheme " (. options :colorscheme))))
