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
  end
  local line = api.nvim_get_current_line()
  local col = api.nvim_win_get_cursor(0)[2]
  local before = line:sub(col, col)
  local after = line:sub(col + 1, col + 1)
  local t = {
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
  }

  if not t[before] then
    return '<CR>'
  end
  if t[before] == after then
    return '<CR><ESC>O'
  end
end, { expr = true })

map.i('<C-e>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-e>'
  else
    return '<End>'
  end
end, { expr = true })

local ns_id, mark_id = vim.api.nvim_create_namespace('my_marks'), nil

map.i('<C-t>', function()
  if not mark_id then
    local row, col = unpack(api.nvim_win_get_cursor(0))
    mark_id = api.nvim_buf_set_extmark(0, ns_id, row - 1, col, {
      virt_text = { { '⚑', 'DiagnosticError' } },
      hl_group = 'Search',
      virt_text_pos = 'inline',
    })
    return
  end
  local mark = api.nvim_buf_get_extmark_by_id(0, ns_id, mark_id, {})
  if not mark or #mark == 0 then
    return
  end
  pcall(api.nvim_win_set_cursor, 0, { mark[1] + 1, mark[2] })
  api.nvim_buf_del_extmark(0, ns_id, mark_id)
  mark_id = nil
end)

-- gX: Web search
map.n('gX', function()
  vim.ui.open(('https://google.com/search?q=%s'):format(vim.fn.expand('<cword>')))
end)

map.x('gX', function()
  local lines = vim.fn.getregion(vim.fn.getpos('.'), vim.fn.getpos('v'), { type = vim.fn.mode() })
  vim.ui.open(('https://google.com/search?q=%s'):format(vim.trim(table.concat(lines, ' '))))
  api.nvim_input('<esc>')
end)

map.n('gs', function()
  local bufnr = api.nvim_create_buf(false, false)
  vim.bo[bufnr].buftype = 'prompt'
  vim.fn.prompt_setprompt(bufnr, '➤ ')
  local width = math.floor(vim.o.columns * 0.5)
  local winid = api.nvim_open_win(bufnr, true, {
    relative = 'editor',
    row = 5,
    width = width,
    height = 4,
    col = math.floor(vim.o.columns / 2) - math.floor(width / 2),
    border = 'rounded',
    title = 'Google Search',
    title_pos = 'center',
  })
  vim.cmd.startinsert()
  vim.wo[winid].number = false
  vim.wo[winid].stc = ''
  vim.wo[winid].lcs = 'trail: '
  vim.wo[winid].wrap = true
  vim.fn.prompt_setcallback(bufnr, function(text)
    vim.ui.open(('https://google.com/search?q=%s'):format(vim.trim(text)))
    api.nvim_win_close(winid, true)
  end)
  vim.keymap.set({ 'n', 'i' }, '<C-c>', function()
    pcall(api.nvim_win_close, winid, true)
  end, { buffer = bufnr })
end)
