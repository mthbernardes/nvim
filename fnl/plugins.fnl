(module plugins 
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(def- plugged-path 
  "~/.config/nvim/plugged")

(defn- plugin-config-exists? [plugin-name]
  (let [plugin-file (core.str (nvim.fn.stdpath "config") "/fnl/plugins/" plugin-name ".fnl")]
    (nvim.fn.filereadable plugin-file)))

(defn- load-plugin-config [plugin-name] 
  (let [plugin-config-exist (plugin-config-exists? plugin-name)
        plugin-ns (core.str "plugins." plugin-name)]
    (if (= 1 plugin-config-exist)
      (require plugin-ns))))

(defn configure [plugins-config] 
  (let [plug-fn (core.get vim.fn "plug#")]
    (nvim.fn.call "plug#begin" ["~/.config/nvim/plugged"])
    (each [plugin-name plugin-opts (pairs plugins-config)]
      (plug-fn (core.str plugin-name))
      (load-plugin-config (core.get plugin-opts :mod))
      (nvim.fn.call "plug#end" []))))

(comment
  (load-plugin-config :telescope)
  (plugin-config-exists? :telescope)
  (configure {:nvim-telescope/telescope.nvim {:mod :telescope}}))
