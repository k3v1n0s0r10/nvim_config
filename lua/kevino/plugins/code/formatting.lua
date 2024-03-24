return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
  { -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    opts = {},
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = {
          --[[c = true, cpp = true ]]
        }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,

      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- sub-list tells conform to run *until* a formatter is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
  {
    'windwp/nvim-autopairs',
    -- Optional dependency
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
