vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

colorscheme gruvbox
]])


--[[]]--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function using_bundler()
    return vim.fn.filereadable(vim.fn.getcwd() .. "/Gemfile.lock") == 1
end

local plugins = {
  'tpope/vim-fugitive',
  'tpope/vim-rails',
  'tpope/vim-endwise',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'yamatsum/nvim-nonicons',
  'ryanoasis/vim-devicons',
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'thoughtbot/vim-rspec',
  'ck3g/vim-change-hash-syntax',
  'ntpeters/vim-better-whitespace',
  'vim-scripts/AutoClose',
  'ngmy/vim-rubocop',
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  { 'Bekaboo/deadcolumn.nvim' },
  -- COLORSCHEMES
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  { "olimorris/onedarkpro.nvim", priority = 1000 },
  { 'junegunn/seoul256.vim', priority = 1000 },
  { "savq/melange-nvim", priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
  { 'rmehri01/onenord.nvim' },
  { 'mhartington/oceanic-next' },
  { "dgox16/oldworld.nvim", lazy = false, priority = 1000, },
  { 'kaiuri/nvim-juliana', lazy = false, opts = { --[=[ configuration --]=] }, config = true, },
  { 'mellow-theme/mellow.nvim' },
  { "alexmozaidze/palenight.nvim" },
  { 'lourenci/github-colors' },
  { 'antonk52/lake.nvim' },
  { "rose-pine/neovim", name = "rose-pine" },
  -- END COLORSCHEMES
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  { 'github/copilot.vim' },
  { 'mileszs/ack.vim' },
  { "akinsho/toggleterm.nvim", event = "VeryLazy", version = "*",
    opts = {
      size = 20,
      open_mapping = "<c-s>",
      shade_terminals = false,
    }
  },
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = {
          -- Python
          "pyright",
          "ruff",
          -- Ruby
          "solargraph",
          "rubocop",
          -- JS/React
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
              -- strict
              -- typeCheckingMode = "strict",

              -- Matching vscode
              typeCheckingMode = "off", -- Matches VSCode
              reportMissingTypeStubs = false,
              reportOptionalMemberAccess = "none",
              reportOptionalSubscript = "none",
              reportOptionalIterable = "none",
              reportGeneralTypeIssues = "none",

              useLibraryCodeForTypes = true,
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly", -- Avoid duplicate linting
            }
          }
        }
      })

      -- Ruff for Fast Linting & Auto-Fixing
      lspconfig.ruff.setup({
        init_options = {
          settings = {
            -- Only enable linting (auto-import fixes handled by Pyright)
            args = {}, -- Modify this if you need custom CLI arguments for ruff
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
                  useBundler = true, -- Uses `bundle exec`
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
  {
    "hrsh7th/nvim-cmp", -- Completion engine
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
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
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
        },
      })
    end,
  },
--[[]]--
  'RRethy/nvim-treesitter-endwise',
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    -- event = { "LazyFile", "VeryLazy" },
    event = { "VeryLazy" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
          -- When in diff mode, we want to use the default
          -- vim text objects c & C instead of the treesitter ones.
          local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
          local configs = require("nvim-treesitter.configs")
          for name, fn in pairs(move) do
            if name:find("goto") == 1 then
              move[name] = function(q, ...)
                if vim.wo.diff then
                  local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                  for key, query in pairs(config or {}) do
                    if q == query and key:find("[%]%[][cC]") then
                      vim.cmd("normal! " .. key)
                      return
                    end
                  end
                end
                return fn(q, ...)
              end
            end
          end
        end,
      },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = { "html", "javascript", "json", "lua", "markdown", "markdown_inline", "vim", "yaml", "ruby", "go", "python" },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
--[[]]--
}

local opts = {}

require("lazy").setup(plugins, opts)

-- local icons = require("nvim-nonicons")
-- local nonicons_extention = require("nvim-nonicons.extentions.lualine")

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.py", "*.rb", "*.js", "*.ts", "*.tsx", "*.jsx" },
    callback = function()
        vim.lsp.buf.format()
    end,
})

-- Makes the sign column always visible
vim.o.signcolumn = "yes"


vim.o.background = "dark" -- or "light" for light mode
vim.o.termguicolors = true
require("gruvbox").setup({
  bold = false,
  contrast = "soft",
})

-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme melange")
-- vim.cmd("colorscheme seoul256")
vim.cmd("colorscheme catppuccin-macchiato")

require('lualine').setup {
  options = {
    icons_enabled = true,
    -- theme = 'onedark',
    theme = 'catppuccin-macchiato',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
  }
}

-- LSP keybindings
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action({ context = { only = { "source.fixAll" } }, apply = true })
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>i", function()
  -- Run isort on the current file silently
  vim.cmd("silent !isort " .. vim.fn.shellescape(vim.fn.expand("%")))
  -- Reload the file to reflect changes
  vim.cmd("edit!")
end, { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fm", function()
  builtin.lsp_document_symbols({
    symbols = { "Function", "Method" },
  })
end, { noremap = true, silent = true })

require('nvim-treesitter.configs').setup {
  endwise = {
    enable = true,
  },
  ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "json" },
  highlight = { enable = true },
  indent = { enable = true },
}


-- Automatically restart LSP servers when Gemfile.lock is updated
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "Gemfile.lock",
  callback = function()
    vim.cmd("LspRestart")
  end,
})

-- Toggle Code Suggestions on/off with CTRL-g in normal mode:
-- vim.keymap.set('n', '<C-g>', '<Plug>(GitLabToggleCodeSuggestions)')


-- https://github.com/orgs/community/discussions/16800
-- vim.g.copilot_node_command = "~/.nvm/versions/node/v16.15.0/bin/node"
-- vim.g.copilot_node_command = "~/.asdf/shims/node"


--[[]]--

