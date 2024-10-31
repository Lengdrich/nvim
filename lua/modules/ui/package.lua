local conf = require('modules.ui.config')

-- packadd({
--   'Lengdrich/whiskyline.nvim',
--   event = 'VeryLazy',
--   config = function()
--     require('whiskyline').setup({
--       bg = '#32302f',
--     })
--   end,
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
-- })

packadd({
  'nvimdev/modeline.nvim',
  event = { 'BufReadPost */*' },
  config = function()
    require('modeline').setup()
  end,
})

packadd({
  'lewis6991/gitsigns.nvim',
  event = 'BufEnter */*',
  config = conf.gitsigns,
})

packadd({
  'nvimdev/indentmini.nvim',
  event = 'BufEnter */*',
  config = function()
    vim.opt.listchars:append({ tab = '  ' })
    require('indentmini').setup({
      only_current = true,
    })
  end,
})

packadd({
  'maxmx03/solarized.nvim',
  lazy = 'false',
  -- event = "VeryLazy",
  config = function()
    local white = '#ced1d1'
    local purple = '#6c71c4'
    local type_color = '#859900'
    local grey = '#839496'
    local magenta = '#d33682'
    require('solarized').setup({
      styles = {
        functions = { bold = true },
        -- variables = { fg = grey },
        parameters = { italic = false },
        keywords = { fg = purple },
        constants = { fg = magenta },
      },
      on_highlights = function(colors, color)
        return {
          ['@constant.builtin.rust'] = { link = 'Type' },
          ['@lsp.type.enumMember'] = { link = 'Type' },
          ['@variable.member'] = { fg = grey },
          ['@variable.builtin'] = { fg = grey },
          ['@keyword.import'] = { fg = purple },
          ['@module.builtin'] = { fg = type_color },
          ['@type.builtin'] = { fg = type_color },
          ['@module'] = { fg = type_color },
          ['@keyword.import.rust'] = { fg = type_color },
          Statement = { bold = true, fg = purple },
          SpecialComment = { fg = '#586e75' },
          Type = { fg = type_color },
          Structure = { fg = type_color },
          Include = { fg = purple },
          Define = { fg = colors.blue },
          Macro = { fg = colors.blue },
          PreCondit = { fg = purple },
          Boolean = { fg = magenta },
          StorageClass = { fg = purple },
          Identifier = { fg = grey },
          Parameter = { fg = grey },
        }
      end,
      -- colors = {},
      -- theme = "neo", -- or 'neosolarized' or 'neo' for short
    })
    vim.cmd.colorscheme('solarized')
  end,
})
