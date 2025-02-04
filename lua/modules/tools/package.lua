local conf = require('modules.tools.config')

packadd({
  'nvimdev/guard.nvim',
  ft = program_ft,
  config = conf.guard,
  dependencies = {
    { 'nvimdev/guard-collection' },
  },
})

packadd({
  'nvimdev/flybuf.nvim',
  cmd = 'FlyBuf',
  config = function()
    require('flybuf').setup({})
  end,
})

packadd({
  'nvimdev/template.nvim',
  -- dev = true,
  cmd = 'Template',
  config = conf.template_nvim,
})

packadd({
  'norcalli/nvim-colorizer.lua',
  fg = 'lua',
  event = 'BufRead',
  config = function()
    vim.opt.termguicolors = true
    require('colorizer').setup()
  end,
})

packadd({
  'keaising/im-select.nvim',
  event = 'InsertEnter',
  config = function()
    require('im_select').setup({
      default_im_select = 'com.apple.keylayout.ABC',
      default_command = 'im-select',
      set_default_events = { 'VimEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave' },
      set_previous_events = {},
      keep_quiet_on_no_binary = false,
      async_switch_im = true,
    })
  end,
})

packadd({
  'nvimdev/fnpairs.nvim',
  event = 'InsertEnter',
  config = function()
    require('fnpairs').setup()
  end,
})

packadd({
  'alexghergh/nvim-tmux-navigation',
  cmd = {
    'NvimTmuxNavigateLeft',
    'NvimTmuxNavigateDown',
    'NvimTmuxNavigateUp',
    'NvimTmuxNavigateRight',
  },
  config = function()
    require('nvim-tmux-navigation').setup({
      disable_when_zoomed = false, -- defaults to false
    })
  end,
})

packadd({
  'nvimdev/dbsession.nvim',
  cmd = { 'SessionSave', 'SessionLoad', 'SessionDelete' },
  opts = true,
})
