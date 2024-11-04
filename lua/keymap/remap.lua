local api = vim.api
local map = require('core.keymap')
local cmd = map.cmd
map.n({
  ['j'] = 'gj',
  ['k'] = 'gk',
  ['<C-s>'] = cmd('write'),
  -- ['<C-x>k'] = cmd(vim.bo.buftype == 'terminal' and 'q!' or 'BufKeepDelete'),
  ['<C-n>'] = cmd('bn'),
  ['<C-p>'] = cmd('bp'),
  ['<C-q>'] = cmd('qa!'),
  --window
  ['<C-h>'] = '<C-w>h',
  ['<C-l>'] = '<C-w>l',
  ['<C-j>'] = '<C-w>j',
  ['<C-k>'] = '<C-w>k',
  ['<A-[>'] = cmd('vertical resize -5'),
  ['<A-]>'] = cmd('vertical resize +5'),
  ['[t'] = cmd('vs | vertical resize -5 | terminal'),
  [']t'] = cmd('set splitbelow | sp | set nosplitbelow | resize -5 | terminal'),
  ['<C-x>t'] = cmd('tabnew | terminal'),

  ['<leader>w'] = cmd('w'),
  ['<leader>y'] = '"+y',
  ['<leader>yy'] = '"+yy',
  ['<leader>2'] = '$',
  ['<leader>p'] = '"+p',

  -- map("v", "<Leader>y", '"+y')
  -- map("v", "<Leader>p", '"+p')
  -- map("v", "<Leader>2", "$")
})

map.v({
  ['<leader>y'] = '"+y',
  ['<leader>p'] = '"+p',
})

map.i({
  ['<C-d>'] = '<C-o>diw',
  ['<C-b>'] = '<Left>',
  ['<C-f>'] = '<Right>',
  ['<C-a>'] = '<Esc>^i',
  ['<C-k>'] = '<C-o>d$',
  ['<C-s>'] = '<ESC>:w<CR>',
  -- ['<C-n>'] = '<Down>',
  -- ['<C-p>'] = '<Up>',
  --down/up
  ['<C-j>'] = '<C-o>o',
  ['<C-l>'] = '<C-o>O',
  --@see https://github.com/neovim/neovim/issues/16416
  ['<C-C>'] = '<C-C>',
  --@see https://vim.fandom.com/wiki/Moving_lines_up_or_down
  ['<A-j>'] = '<Esc>:m .+1<CR>==gi',
})

map.c({
  ['<C-b>'] = '<Left>',
  ['<C-f>'] = '<Right>',
  ['<C-a>'] = '<Home>',
  ['<C-e>'] = '<End>',
  ['<C-d>'] = '<Del>',
  ['<C-h>'] = '<BS>',
})

map.t({
  ['<Esc>'] = [[<C-\><C-n>]],
  ['<C-x>k'] = cmd('quit'),
})

map.i('<C-y>', function()
  if tonumber(vim.fn.pumvisible()) == 1 or vim.fn.getreg('"0'):find('%w') == nil then
    return '<C-y>'
  end
  return '<Esc>p==a'
end, { expr = true })

map.i('<CR>', function()
  if tonumber(vim.fn.pumvisible()) == 1 then
    return '<C-y>'
  else
    return _G.PairMate.cr()
  end
end, { expr = true })
