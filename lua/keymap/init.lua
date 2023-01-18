local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, vmap, tmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.vmap, keymap.tmap
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

  -- 
  { '<C-k>', '<C-w>k', opts(noremap) },

  { '<C-u>', '9k', opts(noremap) },
  { '<C-d>', '9j', opts(noremap) },

  { '<Leader>2', '$', opts(noremap) },

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
  -- Lazy
  { '<Leader>pu', cmd('Lazy update') },
  { '<Leader>pi', cmd('Lazy install') },
  -- dashboard
  { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
  { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
  { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
  -- neotree
  { '<C-n>', cmd('Neotree toggle'), opts(noremap, silent) },
  -- Telescope
  { '<Leader>b', cmd('Telescope buffers'), opts(noremap, silent) },
  { '<Leader>fa', cmd('Telescope live_grep'), opts(noremap, silent) },
  { '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
  -- Lsp
  { '<Leader>li', cmd('LspInfo') },
  { '<Leader>ll', cmd('LspLog') },
  { '<Leader>lr', cmd('LspRestart') },

  --lspsaga
  { ';n', cmd('Lspsaga diagnostic_jump_next') },
  { ';p', cmd('Lspsaga diagnostic_jump_prev') },
  { ';c', cmd('Lspsaga show_cursor_diagnostics') },
  { 'K', cmd('Lspsaga hover_doc') },
  { 'ga', cmd('Lspsaga code_action') },
  { 'gd', cmd('Lspsaga peek_definition') },
  { 'gh', cmd('Lspsaga signature_help') },
  { 'gr', cmd('Lspsaga rename') },
  { 'gs', cmd('Lspsaga lsp_finder') },
  { '<Leader>o', cmd('Lspsaga outline') },

  -- dadbodui
  { '<Leader>d', cmd('DBUIToggle') },

  -- Telescope
  { '<Leader>a', cmd('Telescope app') },
  { '<Leader>j', cmd('Telescope buffers') },
  { '<Leader>fa', cmd('Telescope live_grep') },
  { '<Leader>fs', cmd('Telescope grep_string') },
  {
    '<Leader>e',
    function()
      vim.cmd('Telescope file_browser')
      local esc_key = api.nvim_replace_termcodes('<Esc>', true, false, true)
      api.nvim_feedkeys(esc_key, 'n', false)
    end,
  },
  { '<Leader>ff', cmd('Telescope find_files find_command=rg,--ignore,--hidden,--files') },
  { '<Leader>fg', cmd('Telescope git_files') },
  { '<Leader>fw', cmd('Telescope grep_string') },
  { '<Leader>fh', cmd('Telescope help_tags') },
  { '<Leader>fo', cmd('Telescope oldfiles') },
  { '<Leader>gc', cmd('Telescope git_commits') },
  { '<Leader>fd', cmd('Telescope dotfiles') },

  -- hop.nvim
  -- { 'f', cmd('HopWordAC') },
  -- { 'F', cmd('HopWordBC') },

  -- template.nvim
  -- {
  --   '<Leader>t',
  --   function()
  --     return ':Template '
  --   end,
  --   opts(expr),
  -- },
})

nmap({ 'gcc', cmd('ComComment') })
xmap({ 'gcc', ':ComComment<CR>' })
nmap({ 'gcj', cmd('ComAnnotation') })

-- Lspsaga floaterminal
nmap({ '<A-d>', cmd('Lspsaga open_floaterm') })
tmap({ '<A-d>', [[<C-\><C-n>:Lspsaga close_floaterm<CR>]] })
vim.keymap.set({ 'n', 't' }, '<A-d>', cmd('Lspsaga term_toggle'))

xmap({ 'ga', cmd('Lspsaga code_action') })
