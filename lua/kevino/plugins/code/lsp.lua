return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- Useful status updates for LSP.
    { 'j-hui/fidget.nvim', opts = {} },
    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('LspConfig', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        local telescope_builtin = require 'telescope.builtin'

        -- Jump to the definition of the word under your cursor.
        --  To jump back, press <C-t>.
        map('gd', telescope_builtin.lsp_definitions, '[G]oto [D]efinition')
        -- Find references for the word under your cursor.
        map('gr', telescope_builtin.lsp_references, '[G]oto [R]eferences')
        -- Jump to the implementation of the word under your cursor.
        map('gI', telescope_builtin.lsp_implementations, '[G]oto [I]mplementation')
        -- Jump to the type of the word under your cursor.
        map('<leader>D', telescope_builtin.lsp_type_definitions, 'Type [D]efinition')
        -- Fuzzy find all the symbols in your current document.
        map('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
        -- Fuzzy find all the symbols in your current workspace.
        map('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        -- Rename the variable under your cursor.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        -- Execute a code action, usually your cursor needs to be on top of an error
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        -- Opens a popup that displays documentation about the word under your cursor
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        -- Go to declaration
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      tsserver = {
        -- currently the vue ts plugin is not loading properly (turning hybrid off for now)
        -- init_options = {
        --   plugins = {
        --     {
        --       name = '@vue/typescript-plugin',
        --       location = '~/.nvm/versions/node/v20.11.1/lib/node_modules/@vue/language-server',
        --       languages = { 'vue' },
        --     },
        --   },
        -- },
      },
      volar = {
        filetypes = { 'vue' },
        init_options = {
          vue = {
            hybridMode = false
          }
        }
      },
      rust_analyzer = {}
    }

    require('mason').setup()
    require('mason-lspconfig').setup({
      automatic_installation = true
    })
    require('mason-lspconfig').setup_handlers {
      function(server_name)
        local server = servers[server_name] or {}
        require('lspconfig')[server_name].setup(server)
      end,
    }
  end,
}
