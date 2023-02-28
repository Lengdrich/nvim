local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, vmap, tmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.vmap, keymap.tmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd
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
  { '<Leader>ff', cmd('Telescope find_files find_command=rg,--ignore,--hidden,--files  prompt_prefix=🔍') },
  { '<Leader>fg', cmd('Telescope git_files') },
  { '<Leader>fw', cmd('Telescope grep_string') },
  { '<Leader>fh', cmd('Telescope help_tags') },
  { '<Leader>fo', cmd('Telescope oldfiles') },
  { '<Leader>gc', cmd('Telescope git_commits') },
  { '<Leader>fd', cmd('Telescope dotfiles') },

  -- aerial
  {'<Leader>ao', cmd('AerialToggle')}

  -- template.nvim
  -- {
  --   '<Leader>t',
  --   function()
  --     return ':Template '
  --   end,
  --   opts(expr),
  -- },
})

-- Lspsaga floaterminal
nmap({ '<A-d>', cmd('Lspsaga open_floaterm') })
tmap({ '<A-d>', [[<C-\><C-n>:Lspsaga close_floaterm<CR>]] })
vim.keymap.set({ 'n', 't' }, '<A-d>', cmd('Lspsaga term_toggle'))

xmap({ 'ga', cmd('Lspsaga code_action') })

require("keymap.remap")