return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-java/nvim-java",
    config = false,
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              -- Your custom jdtls settings goes here
            },
          },
          setup = {
            jdtls = function()
              require("java").setup {
                --  list of file that exists in root of the project
                root_markers = {
                  "settings.gradle",
                  "settings.gradle.kts",
                  "pom.xml",
                  "build.gradle",
                  "mvnw",
                  "gradlew",
                  "build.gradle",
                  "build.gradle.kts",
                  ".git",
                  "Config",
                },

                -- load java test plugins
                java_test = {
                  enable = true,
                },

                -- load java debugger plugins
                java_debug_adapter = {
                  enable = true,
                },

                jdk = {
                  -- install jdk using mason.nvim
                  auto_install = true,
                },

                notifications = {
                  -- enable 'Configuring DAP' & 'DAP configured' messages on start up
                  dap = true,
                },

                -- We do multiple verifications to make sure things are in place to run this
                -- plugin
                verification = {
                  -- nvim-java checks for the order of execution of following
                  -- * require('java').setup()
                  -- * require('lspconfig').jdtls.setup()
                  -- IF they are not executed in the correct order, you will see a error
                  -- notification.
                  -- Set following to false to disable the notification if you know what you
                  -- are doing
                  invalid_order = true,

                  -- nvim-java checks if the require('java').setup() is called multiple
                  -- times.
                  -- IF there are multiple setup calls are executed, an error will be shown
                  -- Set following property value to false to disable the notification if
                  -- you know what you are doing
                  duplicate_setup_calls = true,
                },
              }
            end,
          },
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "google-java-format",
        "jdtls",
        "java-debug-adapter",
        "java-test",
        "rust-analyzer",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "java",
        "typescript",
        "rust",
        "python",
        "sql",
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
