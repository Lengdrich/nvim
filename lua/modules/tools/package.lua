local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'glepnir/hlsearch.nvim',
  event = 'BufRead',
  config = function()
    require('hlsearch').setup({})
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
--
package({
  'numToStr/Comment.nvim',
  config = conf.comment,
  event = 'BufRead',
  -- config = function()
  --   require('Comment').setup({})
  -- end
})

-- package({
--   'mfussenegger/nvim-dap',
--
-- })
