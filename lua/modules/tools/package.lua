local package = require('core.pack').package
local conf = require('modules.tools.config')

-- package({
--   'nvim-telescope/telescope.nvim',
--   cmd = 'Telescope',
--   config = conf.telescope,
--   dependencies = {
--     { 'nvim-lua/plenary.nvim' },
--     { 'nvim-telescope/telescope-fzy-native.nvim' },
--   },
-- })

package({
  'glepnir/hlsearch.nvim',
  event = 'BufRead',
  config = function()
    require('hlsearch').setup()
  end,
})

package({
  'kristijanhusak/vim-dadbod-ui',
  cmd = { 'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer' },
  config = conf.vim_dadbod_ui,
  dependencies = { 'tpope/vim-dadbod' },
})

package({
  "iamcco/markdown-preview.nvim",
  ft = {'markdown'},
})

-- package({ 'coman.nvim', dev = true, event = 'BufRead' })

-- package({ 'template.nvim', dev = true, ft = { 'c', 'lua', 'go' }, config = conf.template_nvim })
