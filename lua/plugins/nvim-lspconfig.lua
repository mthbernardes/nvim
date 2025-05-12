-- LSP Configuration & Plugins
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'artemave/workspace-diagnostics.nvim',

    { 'j-hui/fidget.nvim',       opts = {} },

    { 'folke/neodev.nvim',       opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        map('ff', vim.lsp.buf.code_action, '[C]ode [A]ction')

        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then return nil end

        if client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = event.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = event.buf, id = client.id })
            end
          })
        end
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = true })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
        end

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>h', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- Updated LspDetach handler
    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
      callback = function(event)
        -- Check if the highlight group exists before clearing it
        local success, _ = pcall(vim.api.nvim_clear_autocmds, {
          group = 'kickstart-lsp-highlight',
          buffer = event.buf,
        })

        -- Clear references safely
        if success then
          vim.lsp.buf.clear_references()
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    local lspconfig = require 'lspconfig'

    local handlers = {
      function(server_name) -- default handler (optional)
        local server = servers[server_name] or {}
        server.on_attach = function(client, bufnr)
          vim.api.nvim_set_keymap('n', '<leader>e',
            '<cmd>lua vim.diagnostic.open_float(nil, { scope = "cursor", focusable = false, border = "rounded" })<CR>',
            { noremap = true, silent = true })
        end

        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        lspconfig[server_name].setup(server)
      end,
    }

    require('mason-lspconfig').setup {
      handlers = handlers,
    }
  end,
}
