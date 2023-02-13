local package = require('core.pack').package
local conf = require('modules.completion.config')

local enable_lsp_filetype = {
  'go',
  'lua',
  'sh',
  'rust',
  'c',
  'cpp',
  'zig',
  'typescript',
  'typescriptreact',
  'json',
  'python',
  'elixir',
}

package({
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  ft = { 'lua', 'rust', 'c', 'cpp' },
  config = conf.nvim_lsp,
})

package({
  "williamboman/mason.nvim",
  cmd = 'Mason',
  config = conf.mason_nvim,
})

package({
  "glepnir/lspsaga.nvim",
  branch = "main",
  ft = enable_lsp_filetype,
  config = conf.lspsaga,
})

package({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
  },
})

package({ 'L3MON4D3/LuaSnip',
  event = 'InsertCharPre',
  config = conf.lua_snip })
package({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.auto_pairs })
