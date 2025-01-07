return {
  "onsails/lspkind.nvim",
  config = function()
    require("lspkind").init({
      mode = "symbol_text", -- Show symbol and text
      preset = "default",
    })
  end,
}
