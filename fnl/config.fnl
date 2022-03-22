(module config
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(defn set-general-options [general-options]
  (each [option value (pairs general-options)]
    (core.assoc nvim.o option value)))
