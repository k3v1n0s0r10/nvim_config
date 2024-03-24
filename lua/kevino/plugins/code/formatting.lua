-- Command to format with conform
vim.api.nvim_create_user_command('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end
  require('conform').format { async = true, lsp_fallback = true, range = range }
end, { range = true })

return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
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
      -- format_on_save = function(bufnr)
      --   local disable_filetypes = {
      --     --[[c = true, cpp = true ]]
      --   }
      --   return {
      --     timeout_ms = 500,
      --     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      --   }
      -- end,

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
