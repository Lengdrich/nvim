local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, vmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- usage example
nmap({
  -- noremal remap
  -- close buffer
  { '<C-x>k', cmd('bdelete'), opts(noremap, silent) },
  -- save
  { '<C-s>', cmd('write'), opts(noremap) },
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

  -- 
  { '<C-k>', '<C-w>k', opts(noremap) },

  { '<C-u>', '9k', opts(noremap) },
  { '<C-d>', '9j', opts(noremap) },

  { '<Leader>w', ':w<CR>', opts(noremap) },

  { '<Leader>p', '"+p', opts(noremap) },
  { '<Leader>P', '"+P', opts(noremap) },
  { '<Leader>y', '"+y', opts(noremap) },
  { '<Leader>Y', '"+Y', opts(noremap) },
})

imap({
  -- insert mode
  { '<C-h>', '<Bs>', opts(noremap) },
  { '<C-e>', '<End>', opts(noremap) },
  { 'jk', '<ESC>', opts(noremap) },
  { 'Jk', '<ESC>', opts(noremap) },
  { 'JK', '<ESC>', opts(noremap) },
  { '<C-h>', '<Left>', opts(noremap) },
  { '<C-j>', '<Down>', opts(noremap) },
  { '<C-k>', '<Up>', opts(noremap) },
  { '<C-l>', '<Right>', opts(noremap) },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })

vmap({
  { '<Leader>p', '"+p', opts(noremap) },
  { '<Leader>P', '"+P', opts(noremap) },
  { '<Leader>y', '"+y', opts(noremap) },
  { '<Leader>Y', '"+Y', opts(noremap) },
  -- { 'JK', '<ESC>', opts(noremap) },
  -- { 'JK', '<ESC>', opts(noremap) },

  { '<', '<gv', opts(noremap) },
  { '>', '>gv', opts(noremap) },
})

-- usage of plugins
nmap({
  -- packer
  { '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
  { '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
  { '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- nvimtree
  { '<C-n>', cmd('NvimTreeToggle'), opts(noremap, silent) },
  -- Telescope
  { '<Leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
})
