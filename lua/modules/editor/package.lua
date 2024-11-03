local conf = require('modules.editor.config')

packadd({
  'ibhagwan/fzf-lua',
  cmd = 'FzfLua',
  config = function()
    require('fzf-lua').setup({ 'max-perf' })
  end,
})

packadd({
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufRead', 'BufNewFile' },
  build = ':TSUpdate',
  config = conf.nvim_treesitter,
})

packadd({
  'nvim-treesitter/nvim-treesitter-textobjects',
  ft = { 'c', 'rust', 'go', 'lua', 'cpp' },
  config = function()
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup({
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = { query = '@class.inner' },
            },
          },
        },
      })
    end, 0)
  end,
})

packadd({
  'folke/flash.nvim',
  event = 'BufRead',
  opts = {
    modes = {
      search = { enabled = false },
      char = { enabled = false },
    },
  },
  keys = function()
    return {
      {
        'f',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'o', 'x' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Flash Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    }
  end,
})
