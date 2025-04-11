-- load defaults i.e lua_lsp
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local servers = { "html", "cssls", "pyright", "ruff", "gopls", "solargraph" }
local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",  -- ou "strict" para mypy-like checks
      },
    },
  },
})

lspconfig.ruff.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    settings = {
      args = { "--ignore=E501" },  -- Ignora erros de linha muito longa
    },
  },
})

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,  -- Habilita gofumpt
    },
  },
})

lspconfig.solargraph.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true,
      formatting = true,
        useBundler = false,  -- Altere para true se usar Bundler
        -- Configurações adicionais importantes:
        initializationOptions = {
          formatting = true,
        },
        commandPath = vim.fn.exepath('solargraph'),  -- Garante o caminho correto
    },
  },
  init_options = {
    formatting = true
  },
  flags = {
    debounce_text_changes = 150,
  }
})
-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
