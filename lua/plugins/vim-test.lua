return {
  'vim-test/vim-test',
  config = function()
    vim.g["test#strategy"] = "neovim"
  end,
  keys = {
    {
      "<space>tf",
      ":TestFile<CR>",
      mode = "n",
      desc = "[T]est [R]un",
    },{
      "<space>t",
      ":TestNearest<CR>",
      mode = "n",
      desc = "[T]est Nearest",
    }
  }
}
