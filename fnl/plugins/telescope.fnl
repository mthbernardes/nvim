(module plugins.telescope
  {autoload {telescope telescope
             nvim aniseed.nvim}})

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})

(nvim.set_keymap :n :<c-p> ":lua require('telescope.builtin').find_files()<CR>" {:noremap true})
(nvim.set_keymap :n :<c-f> ":lua require('telescope.builtin').live_grep()<CR>" {:noremap true})
(nvim.set_keymap :n :<c-b> ":lua require('telescope.builtin').buffers()<CR>" {:noremap true})
