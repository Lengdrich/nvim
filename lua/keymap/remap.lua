local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, vmap, tmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.vmap, keymap.tmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
-- nmap({ ' ', '', opts(noremap) })
-- xmap({ ' ', '', opts(noremap) })

-- usage example
nmap({
  -- noremal remap
  -- close buffer
  { '<C-x>k', cmd('bdelete'), opts(noremap, silent) },
  -- save
  { '<Leader>w', cmd('write'), opts(noremap) },
  -- yank
  { 'Y', 'y$', opts(noremap) },
  -- buffer jump
  { ']b', cmd('bn'), opts(noremap) },
  { '[b', cmd('bp'), opts(noremap) },
  -- remove trailing white space
  { '<Leader>t', cmd('TrimTrailingWhitespace'), opts(noremap) },
  -- window jump
  { '<C-h>', '<C-w>h', opts(noremap) },
  { '<C-l>', '<C-w>l', opts(noremap) },
  { '<C-j>', '<C-w>j', opts(noremap) },
  { '<C-k>', '<C-w>k', opts(noremap) },

  { '<C-h>', cmd('NvimTmuxNavigateLeft'), opts(noremap, silent) },
  { '<C-j>', cmd('NvimTmuxNavigateDown'), opts(noremap, silent) },
  { '<C-k>', cmd('NvimTmuxNavigateUp'), opts(noremap, silent) },
  { '<C-l>', cmd('NvimTmuxNavigateRight'), opts(noremap, silent) },
  { '<C-\\>', cmd('NvimTmuxNavigateLastActive'), opts(noremap, silent) },
  -- { '<C-Space>', cmd('NvimTmuxNavigateNext'), opts(noremap, silent) },

  -- { '<C-u>', '9k', opts(noremap) },
  -- { '<C-d>', '9j', opts(noremap) },

  { '<Leader>2', '$', opts(noremap) },

  { '<Leader>p', '"+p', opts(noremap) },
  { '<Leader>P', '"+P', opts(noremap) },
  { '<Leader>y', '"+y', opts(noremap) },
  { '<Leader>Y', '"+Y', opts(noremap) },
})

-- imap({
  -- insert mode
  -- { 'jk', '<ESC>', opts(noremap) },
  -- { 'Jk', '<ESC>', opts(noremap) },
  -- { 'JK', '<ESC>', opts(noremap) },
  -- { '<C-h>', '<Left>', opts(noremap) },
  -- { '<C-j>', '<Down>', opts(noremap) },
  -- { '<C-k>', '<Up>', opts(noremap) },
  -- { '<C-l>', '<Right>', opts(noremap) },
-- })

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })

vmap({
  { '<Leader>p', '"+p', opts(noremap) },
  { '<Leader>P', '"+P', opts(noremap) },
  { '<Leader>y', '"+y', opts(noremap) },
  { '<Leader>Y', '"+Y', opts(noremap) },

  { '<', '<gv', opts(noremap) },
  { '>', '>gv', opts(noremap) },
  { '<Leader>2', '$', opts(noremap) },
})


