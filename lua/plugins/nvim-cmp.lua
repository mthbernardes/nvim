return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Load VSCode-style snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- LuaSnip setup
    luasnip.config.setup({
      history = true,
      update_events = "TextChanged,TextChangedI",
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
        ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- Scroll docs down
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm({ select = false }) -- Confirm the selected item
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()        -- Expand snippet or jump to next placeholder
          else
            fallback()                      -- Fallback to default behavior
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- Add LSP source as highest priority
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      -- Add completion formatting
      formatting = {
        format = function(entry, vim_item)
          -- Add source name to completion menu
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]"
          })[entry.source.name]
          return vim_item
        end,
      },
    })
  end,
}
