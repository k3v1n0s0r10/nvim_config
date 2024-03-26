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
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Open Lazy Git' },
    },
    config = function()
      require('telescope').load_extension 'lazygit'
      vim.g.lazygit_floating_window_winblend = 0 -- " transparency of floating window
      vim.g.lazygit_floating_window_scaling_factor = 0.94 -- " scaling factor for floating window
      vim.g.lazygit_floating_window_use_plenary = 1
      --let g:lazygit_use_neovim_remote = 1 -- " fallback to 0 if neovim-remote is not installed
    end,
  },
}
