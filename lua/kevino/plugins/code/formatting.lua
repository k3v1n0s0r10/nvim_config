-- Command to format with conform

return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
  {
    'terrortylor/nvim-comment',
    keys = {
      {'<leader>cc', ':CommentToggle<cr>', mode = {"n", "v"} , desc = '[C]ode [C]omment'}
    },
    config = function ()
      require('nvim_comment').setup({ create_mappings = false })
    end
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        desc = '[C]ode [F]ormat',
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        -- Conform can run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- sub-list tells conform to run *until* a formatter is found.
        -- javascript = { { "prettierd", "prettier" } },
        lua = { 'stylua' },
        javascript = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        json = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
        typescriptjavascript = { { 'prettierd', 'prettier' } },
        rust = { 'rustfmt' },
      },
    },
  },
  {
    'windwp/nvim-autopairs',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
