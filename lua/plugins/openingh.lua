-- openingh is the plugin to open the code direct on Github

return {
  "almo7aya/openingh.nvim",
  keys = {
    {
      "<leader>og",
      ":OpenInGHFileLines<CR>",
      mode = "n",
      desc = "[O]open [G]ithub",
    }
  }
}
