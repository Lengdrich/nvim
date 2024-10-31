local conf = require('modules.editor.config')

-- app list
-- vim.split(vim.fn.globpath('/Applications/', '*.app'), '\n')
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

--@see https://github.com/nvim-treesitter/nvim-treesitter-textobjects/issues/507
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
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = 'Neotree toggle',

  keys = function()
    return {
      { '<C-n>', '<cmd>Neotree toggle<CR>', desc = 'toggle neotree' },
    }
  end,

  opts = {
    window = {
      -- position = "right",
      width = 25,

      mappings = {
        ['<space>'] = {
          'toggle_node',
          nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
        },
        ['<2-LeftMouse>'] = 'open',
        -- ["<cr>"] = "open",
        ['o'] = { 'open', nowait = true },
        ['oc'] = 'noop',
        ['od'] = 'noop',
        ['og'] = 'noop',
        ['om'] = 'noop',
        ['on'] = 'noop',
        ['os'] = 'noop',
        ['ot'] = 'noop',
      },
    },

    filesystem = {
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
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

packadd({
  'glepnir/hlsearch.nvim',
  event = 'BufRead',
  config = function()
    require('hlsearch').setup()
  end,
})
