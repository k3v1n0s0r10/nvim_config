return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle File Tree' },
  },
  cmd = 'NvimTree',
  opts = {
    view =  {
      side = "right"
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    update_focused_file = {
      enable = true,
    },
    log = {
      enable = true,
    },
    renderer = {
      highlight_git = true,
      highlight_diagnostics = true,
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
      custom = {},
    },
  },
}
