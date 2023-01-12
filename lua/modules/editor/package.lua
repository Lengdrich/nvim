local package = require('core.pack').package
local conf = require('modules.editor.config')

package({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  config = conf.nvim_treesitter,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
})

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  },
})

package({
  'ggandor/leap.nvim',
  event = 'BufRead',
  dependencies = {
    'tpope/vim-repeat',
  },
  config = conf.leap,
})

-- package({ 'mutchar.nvim', dev = true, ft = { 'c', 'cpp', 'go', 'rust' }, config = conf.mut_char })

package({ 'phaazon/hop.nvim', event = 'BufRead', config = conf.hop })
