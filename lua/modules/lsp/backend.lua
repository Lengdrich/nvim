local M = {}
local lspconfig = require('lspconfig')

function M._attach(client, _)
  client.server_capabilities.semanticTokensProvider = nil
end

lspconfig.gopls.setup({
  cmd = { 'gopls', 'serve' },
  on_attach = M._attach,
  capabilities = M.capabilities,
  settings = {
    gopls = {
      usePlaceholders = true,
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
      -- semanticTokens = true,
      staticcheck = true,
    },
  },
})

lspconfig.lua_ls.setup({
  on_attach = M._attach,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
      },
      completion = {
        callSnippet = 'Replace',
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
        },
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

lspconfig.clangd.setup({
  cmd = {
    'clangd',
    '--background-index',
  },
  init_options = {
    fallbackFlags = {
      _G.is_mac and '-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX14.4.sdk/usr/include',
      _G.is_mac and '-isystem/opt/homebrew/Cellar/sdl2/2.30.5/include',
      _G.is_mac and '-isystem/opt/homebrew/Cellar/glew/2.2.0_1/include',
      _G.is_mac and '-isystem/opt/homebrew/Cellar/freetype/2.13.2/include/freetype2',
    },
  },
  on_attach = M._attach,
  capabilities = M.capabilities,
  root_dir = function(fname)
    return lspconfig.util.root_pattern(unpack({
      --reorder
      'compile_commands.json',
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_flags.txt',
      'configure.ac', -- AutoTools
    }))(fname) or lspconfig.util.find_git_ancestor(fname)
  end,
})

lspconfig.rust_analyzer.setup({
  on_attach = M._attach,
  capabilities = M.capabilities,
  settings = {
    ['rust-analyzer'] = {
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

local servers = {
  'pyright',
  'bashls',
  'zls',
}
-- lspconfig.pylsp.setup({ settings = { pylsp = { plugins = { pylint = { enabled = true } } } } })

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = M._attach,
    capabilities = M.capabilities,
  })
end

vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
  local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.reset(ns, bufnr)
  return true
end

return M
