(module plugins.sexp
  {autoload {core aniseed.core
             sexp sexp
             nvim aniseed.nvim}})

(set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet")
