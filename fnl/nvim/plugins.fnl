(module nvim.plugins 
  {autoload {nvim aniseed.nvim
             core aniseed.core
             packer packer}}) 

(defn- safe-require-plugin-config [plugin-ns]
  (let [(ok? val-or-err) (pcall require plugin-ns)]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- plugin-config-exists? [plugin-name]
  (let [stdpath (nvim.fn.stdpath "config")
        plugin-file (.. stdpath "/fnl/nvim/plugins/" plugin-name ".fnl")]
    (= 1 (nvim.fn.filereadable plugin-file))))

(defn- load-plugin-config [plugin-name] 
  (when (plugin-config-exists? plugin-name)
    (let [plugin-ns (.. "nvim.plugins." plugin-name)]
      (safe-require-plugin-config plugin-ns))))

(defn configure [plugins-config]
  (packer.startup 
    (fn [use] 
      (each [plugin-name opts (pairs plugins-config)]
        (-?> (. opts :mod) (load-plugin-config))
        (use (core.assoc opts 1 plugin-name))))
    nil))

(comment
  (load-plugin-config :telescope)
  (plugin-config-exists? :telescope)
  (configure {:nvim-telescope/telescope.nvim {:mod :telescope}})
  (configure {:Shougo/deoplete.nvim {:mod :deoplete :config {"do" ":UpdateRemotePlugins"}}})
  )
