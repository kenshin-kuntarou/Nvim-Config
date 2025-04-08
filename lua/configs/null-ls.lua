local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,  -- Formatação automática
    null_ls.builtins.diagnostics.mypy,  -- Checagem de tipos   

    -- Formatters para Go
    null_ls.builtins.formatting.gofumpt,    -- Formatação estrita
    null_ls.builtins.formatting.goimports,  -- Organiza imports
    null_ls.builtins.formatting.golines.with({  -- Quebra de linhas longas
      extra_args = { "--max-len=80" },    
    }),
  },
})

