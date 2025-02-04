require('keymap.remap')
local map = require('core.keymap')
local cmd = map.cmd

map.n({
  -- Lspsaga
  ['[d'] = cmd('Lspsaga diagnostic_jump_next'),
  [']d'] = cmd('Lspsaga diagnostic_jump_prev'),
  ['K'] = cmd('Lspsaga hover_doc'),
  ['ga'] = cmd('Lspsaga code_action'),
  ['gr'] = cmd('Lspsaga rename'),
  ['gp'] = cmd('Lspsaga peek_definition'),
  ['gd'] = cmd('Lspsaga goto_definition'),
  ['gh'] = cmd('Lspsaga finder'),
  ['<Leader>o'] = cmd('Lspsaga outline'),
  ['<Leader>d'] = cmd('Dired'),
  -- dbsession
  ['<Leader>ss'] = cmd('SessionSave'),
  ['<Leader>sl'] = cmd('SessionLoad'),
  -- FzfLua
  ['<Leader>b'] = cmd('FzfLua buffers'),
  ['<Leader>fa'] = cmd('FzfLua live_grep_native'),
  ['<Leader>fs'] = cmd('FzfLua grep_cword'),
  ['<Leader>ff'] = cmd('FzfLua files'),
  ['<Leader>fh'] = cmd('FzfLua helptags'),
  ['<Leader>fo'] = cmd('FzfLua oldfiles'),
  ['<Leader>fg'] = cmd('FzfLua git_files'),
  ['<Leader>gc'] = cmd('FzfLua git_commits'),
  ['<Leader>fc'] = cmd('FzfLua files cwd=$HOME/.config'),
  -- flybuf.nvim
  ['<Leader>j'] = cmd('FlyBuf'),
  --gitsign
  [']g'] = cmd('lua require"gitsigns".next_hunk()<CR>'),
  ['[g'] = cmd('lua require"gitsigns".prev_hunk()<CR>'),
  --======================tmux navigate======================
  ['<C-h>'] = cmd('NvimTmuxNavigateLeft'),
  ['<C-j>'] = cmd('NvimTmuxNavigateDown'),
  ['<C-k>'] = cmd('NvimTmuxNavigateUp'),
  ['<C-l>'] = cmd('NvimTmuxNavigateRight'),
})

vim.keymap.set({ 'n' }, '<C-x><C-f>', function()
  require('fzf-lua').complete_file({
    cmd = 'rg --files',
    winopts = { preview = { hidden = 'nohidden' } },
  })
end, { silent = true, desc = 'Fuzzy complete file' })

--template.nvim
map.n('<Leader>t', function()
  local tmp_name
  if vim.bo.filetype == 'lua' then
    tmp_name = 'nvim_temp'
  end
  if tmp_name then
    vim.cmd('Template ' .. tmp_name)
    return
  end
  return ':Template '
end, { expr = true })

-- Lspsaga floaterminal
map.nt('<A-d>', cmd('Lspsaga term_toggle'))

map.nx('ga', cmd('Lspsaga code_action'))
