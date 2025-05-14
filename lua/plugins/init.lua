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

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true, -- Isso carrega a configuração padrão
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- ... outros plugins existentes ...

  -- Adicione estes novos plugins para Ruby:
  {
    "ruby-formatter/rufo-vim", -- Formatter para Ruby
    ft = "ruby",
  },
  {
    "jlcrochet/vim-ruby", -- Melhor suporte para Ruby
    ft = "ruby",
  },
  {
    "tpope/vim-bundler", -- Suporte para Bundler
    ft = "ruby",
  },
  {
    "tpope/vim-rails", -- Suporte para Rails
    ft = "ruby",
  },
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- Adicione suas opções aqui, se desejar
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- Opcional:
      "rcarriga/nvim-notify",
    }
  },
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    options = {
      paddingVertical = "0px",
      paddingHorizontal = "0px",
      backgroundImage = nil,
      backgroundImageSelection = nil,
      backgroundMode = "color",
      backgroundColor = "gray",
      dropShadow = false,
      dropShadowOffsetY = "20px",
      dropShadowBlurRadius = "68px",
      theme = "vscode",
      windowTheme = "sharp",
      fontFamily = "Hack",
      windowControls = true,
      widthAdjustment = false,
      lineNumbers = false,
      firstLineNumber = 1,
      exportSize = "2x",
      watermark = false,
      squaredImage = false,
      hiddenCharacters = false,
      name = "",
      width = 675,
      highlights = nil,
    },
  },
  {
    "frankroeder/parrot.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
    require("parrot").setup({
      providers = {
        perplexity = {
          enabled = true,
          -- aqui você pode configurar sua chave de API se necessário
        },
        -- outros provedores podem ser ativados conforme desejar
      },
      -- outras configurações opcionais
    })
    end,
    cmd = { "Parrot" },
    lazy = true,
  }
}

-- {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	opts = {
-- 		ensure_installed = {
-- 			"vim", "lua", "vimdoc",
--      "html", "css"
-- 		},
-- 	},
-- },
