return {
  "folke/tokyonight.nvim",
  priority = 1000, -- Ensure the theme loads before other plugins
  config = function()
    require("tokyonight").setup({
      style = "storm", -- Options: storm, night, moon, day
      transparent = false, -- Disable setting a transparent background
      terminal_colors = true, -- Apply colors to Neovim's terminal
      styles = {
        comments = { italic = false }, -- Disable italics for comments
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        sidebars = "dark", -- Darken sidebars like NvimTree
        floats = "dark", -- Darken floating windows
      },
      on_highlights = function(highlights, colors)
        -- Custom highlight adjustments
        highlights.Comment = { fg = colors.blue } -- Remove italics for comments
      end,
    })

    -- Apply the colorscheme
    vim.cmd.colorscheme("tokyonight")
  end,
}
