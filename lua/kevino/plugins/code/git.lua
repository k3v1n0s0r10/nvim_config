return {
  'f-person/git-blame.nvim',
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Open Lazy Git' },
    },
    config = function()
      require('telescope').load_extension 'lazygit'
    end,
  },
}
