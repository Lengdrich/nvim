local api = vim.api
local lspconfig = require 'lspconfig'
local global = require 'domain.global'
local action = require 'lspsaga.action'
local saga = require 'lspsaga.saga'

saga.init_lsp_saga()

local enhance_attach = function(client,bufnr)
  local has_completion,completion = pcall(require,'completion')
  if not has_completion then
    print('Does not load completion-nvim')
    return
  end
  completion.on_attach()

  if client.resolved_capabilities.document_formatting then
    action.lsp_before_save()
  end
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

lspconfig.gopls.setup {
  cmd = {"gopls","--remote=auto"},
  on_attach = enhance_attach,
  capabilities ={
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  },
  init_options = {
    usePlaceholders=true,
    completeUnimported=true,
  }
}

lspconfig.sumneko_lua.setup {
  cmd = { global.home.."/workstation/lua-language-server/bin/macOS/lua-language-server", "-E",
          global.home.."/workstation/lua-language-server/main.lua"};
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {"vim"}
      },
      runtime = {version = "LuaJIT"},
      workspace = {
        library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true},{}),
      },
    },
  }
}

lspconfig.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    enhance_attach(client)
  end
}

lspconfig.dockerls.setup {on_attach = enhance_attach}

lspconfig.bashls.setup {on_attach = enhance_attach}