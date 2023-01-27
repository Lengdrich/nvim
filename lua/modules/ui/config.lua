local config = {}

function config.zephyr()
  -- vim.cmd('colorscheme zephyr')
end

function config.onedarkpro()
  -- vim.cmd('colorscheme onedark')
end

function config.tokyonight()
  -- vim.cmd('colorscheme tokyonight')
end

function config.gruvbox()
  require('gruvbox').setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = false,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    dim_inactive = false,
    transparent_mode = false,
    overrides = {
      String = {fg = "#00a000"}
    },
  })

  vim.cmd('colorscheme gruvbox')
end

function config.dashboard()
  local db = require('dashboard')
  local z = require('zephyr')
  db.session_directory = vim.env.HOME .. '/.cache/nvim/session'
  db.preview_command = 'cat | lolcat -F 0.3'
  db.preview_file_path = vim.env.HOME .. '/.config/nvim/static/neovim.cat'
  db.preview_file_height = 11
  db.preview_file_width = 70
  db.custom_center = {
    {
      icon = '  ',
      icon_hl = { fg = z.red },
      desc = 'Update Plugins                          ',
      shortcut = 'SPC p u',
      action = 'Lazy update',
    },
    {
      icon = '  ',
      icon_hl = { fg = z.yellow },
      desc = 'Recently opened files                   ',
      action = 'Telescope oldfiles',
      shortcut = 'SPC f h',
    },
    {
      icon = '  ',
      icon_hl = { fg = z.cyan },
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f',
    },
    {
      icon = '  ',
      icon_hl = { fg = z.blue },
      desc = 'File Browser                            ',
      action = 'Telescope file_browser',
      shortcut = 'SPC   e',
    },
    {
      icon = '  ',
      icon_hl = { fg = z.oragne },
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f b',
    },
    {
      icon = '  ',
      icon_hl = { fg = z.redwine },
      desc = 'Open Personal dotfiles                  ',
      action = 'Telescope dotfiles path=' .. vim.env.HOME .. '/.dotfiles',
      shortcut = 'SPC f d',
    },
  }
end

function config.nvim_bufferline()
  require('bufferline').setup({
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
    },
  })
end

-- function config.nvim_tree()
--   require('nvim-tree').setup({
--     disable_netrw = false,
--     hijack_cursor = true,
--     hijack_netrw = true,
--   })
-- end

function config.neo_tree()

  require("neo-tree").setup({

    window = {
      position = "left",
      width = 25,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<space>"] = { 
            "toggle_node", 
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
        },
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["o"] = "open",
        ["<esc>"] = "revert_preview",
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["l"] = "focus_preview",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        -- ["S"] = "split_with_window_picker",
        -- ["s"] = "vsplit_with_window_picker",
        ["t"] = "open_tabnew",
        -- ["<cr>"] = "open_drop",
        -- ["t"] = "open_tab_drop",
        ["w"] = "open_with_window_picker",
        --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
        ["C"] = "close_node",
        ["z"] = "close_all_nodes",
        --["Z"] = "expand_all_nodes",
        ["a"] = { 
          "add",
          -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
          -- some commands may take optional config options, see `:h neo-tree-mappings` for details
          config = {
            show_path = "none" -- "none", "relative", "absolute"
          }
        },
        ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
        -- ["c"] = {
        --  "copy",
        --  config = {
        --    show_path = "none" -- "none", "relative", "absolute"
        --  }
        --}
        ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
      }
    },
  })

  vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
end

function config.galaxyline()
  require('modules.ui.bubbleline')
end

function config.indent_blankline()
  require('indent_blankline').setup({
    char = '|',
    use_treesitter_scope = true,
    show_first_indent_level = true,
    show_current_context = false,
    show_current_context_start = false,
    show_current_context_start_on_current_line = false,
    filetype_exclude = {
      'dashboard',
      'DogicPrompt',
      'log',
      'fugitive',
      'gitcommit',
      'packer',
      'markdown',
      'json',
      'txt',
      'vista',
      'help',
      'todoist',
      'NvimTree',
      'git',
      'TelescopePrompt',
      'undotree',
    },
    buftype_exclude = { 'terminal', 'nofile', 'prompt' },
    context_patterns = {
      'class',
      'function',
      'method',
      'block',
      'list_literal',
      'selector',
      '^if',
      '^table',
      'if_statement',
      'while',
      'for',
    },
  })
end

function config.noice_nvim()
  require("noice").setup({
      -- add any options here
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
  -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  })
end

return config
