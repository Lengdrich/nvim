local package = require('core.pack').package
local conf = require('modules.ui.config')

package({ 'glepnir/zephyr-nvim', config = conf.zephyr })

package({ 'navarasu/onedark.nvim', config = conf.onedark})

package({ "folke/tokyonight.nvim", config = conf.tokyonight })

package({"ellisonleao/gruvbox.nvim", config = conf.gruvbox})

-- package({ 'glepnir/dashboard-nvim', event = 'VimEnter', config = conf.dashboard })

package({
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = conf.dashboard,
  dependencies = {
    'kyazdani42/nvim-web-devicons'
  }
})
-- package({
--   'kyazdani42/nvim-tree.lua',
--   cmd = 'NvimTreeToggle',
--   config = conf.nvim_tree,
--   dependencies = 'kyazdani42/nvim-web-devicons',
-- })

package({
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  cmd = 'Neotree toggle',
  config = conf.neo_tree,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  }
})

package({ 
  'akinsho/nvim-bufferline.lua', 
  config = conf.nvim_bufferline, 
  requires = 'kyazdani42/nvim-web-devicons' 
})

package({
  'glepnir/galaxyline.nvim',
  config = conf.galaxyline,
  dependencies = { 'kyazdani42/nvim-web-devicons',},
})

-- package({ 'feline-nvim/feline.nvim', config = conf.feline_config, })

local enable_indent_filetype = {
  'go',
  'lua',
  'sh',
  'rust',
  'cpp',
  'typescript',
  'typescriptreact',
  'javascript',
  'json',
  'python',
}

package({
  'lukas-reineke/indent-blankline.nvim',
  ft = enable_indent_filetype,
  config = conf.indent_blankline,
})

package({
  "echasnovski/mini.indentscope",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
  config = conf.mini_indentscope,
})

package({
  "folke/noice.nvim",
  config = conf.noice_nvim,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  }
})

package({
  'lewis6991/gitsigns.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.gitsigns,
})
