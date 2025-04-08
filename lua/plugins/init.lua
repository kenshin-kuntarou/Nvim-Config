return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",  -- Já deve estar instalado pelo NvChad
  },
  {
    "williamboman/mason.nvim",  -- Já deve estar instalado
  },
  {
    "williamboman/mason-lspconfig.nvim",  -- Já deve estar instalado
  },
  {
    "jose-elias-alvarez/null-ls.nvim",  -- Para formatters/linters (BufWritePrelack, mypy)
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",  -- Carrega apenas para arquivos Go
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("gopher").setup()
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
