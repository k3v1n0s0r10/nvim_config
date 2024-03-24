return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    keys = {
      { '<C-h>', '<cmd> TmuxNavigateLeft<cr>', desc = 'Window Left' },
      { '<C-k>', '<cmd> TmuxNavigateUp<cr>', desc = 'Window Up' },
      { '<C-j>', '<cmd> TmuxNavigateDown<cr>', desc = 'Window Down' },
      { '<C-l>', '<cmd> TmuxNavigateRight<cr>', desc = 'Window Right' },
    },
  },
}
