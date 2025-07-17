local function using_bundler()
  return vim.fn.filereadable(vim.fn.getcwd() .. "/Gemfile.lock") == 1
end

return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "pyright",
          "ruff",
          "ts_ls",
          "eslint"
        },
      }

      local lspconfig = require("lspconfig")

      -- Pyright for Type Checking
      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              reportMissingTypeStubs = false,
              reportOptionalMemberAccess = "none",
              reportOptionalSubscript = "none",
              reportOptionalIterable = "none",
              reportGeneralTypeIssues = "none",
              useLibraryCodeForTypes = true,
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
            }
          }
        }
      })

      -- Ruff for Fast Linting & Auto-Fixing
      lspconfig.ruff.setup({
        init_options = {
          settings = {
            args = {},
          }
        }
      })

      -- Solargraph with Bundler Support
      lspconfig.solargraph.setup({
        cmd = using_bundler() and { "bundle", "exec", "solargraph", "stdio" } or { "solargraph", "stdio" },
        settings = {
          solargraph = {
            diagnostics = true,
            formatting = true,
            completion = true,
            useBundler = true,
            rubocop = false,
          }
        }
      })

      -- RuboCop LSP with Bundler Support
      lspconfig.rubocop.setup({
        cmd = using_bundler() and { "bundle", "exec", "rubocop", "--lsp" } or { "rubocop", "--lsp" },
      })

      lspconfig.ts_ls.setup({
        settings = {
          completions = {
            completeFunctionCalls = true
          }
        }
      })

      lspconfig.eslint.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll"
          })
        end
      })
    end,
  },
  
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
  
  -- Snippets
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  
  -- Null-ls for formatting
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        debug = true,
        sources = {
          null_ls.builtins.diagnostics.ruff,
          null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
          null_ls.builtins.formatting.isort,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.prettier.with({
            filetypes = { "javascript", "typescript", "json", "css", "html", "yaml", "tsx" },
          }),
          require("none-ls.diagnostics.eslint"),
        },
      })
    end,
  },
}