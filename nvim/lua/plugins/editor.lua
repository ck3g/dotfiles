return {
  -- Tim Pope essentials
  'tpope/vim-fugitive',
  'tpope/vim-rails',
  'tpope/vim-endwise',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  
  -- Ruby/Rails specific
  'thoughtbot/vim-rspec',
  'ck3g/vim-change-hash-syntax',
  'ngmy/vim-rubocop',
  'tpope/vim-bundler',
  
  -- Additional vim plugins from bundle
  'elixir-editors/vim-elixir',
  'camdencheek/tree-sitter-dockerfile',
  
  -- Rust development
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    config = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('rust-tools').setup({
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set('n', '<Leader>ca', '<cmd>RustCodeAction<CR>', { buffer = bufnr })
            vim.keymap.set('n', '<Leader>rr', '<cmd>RustRunnables<CR>', { buffer = bufnr })
            vim.keymap.set('n', '<Leader>rt', '<cmd>RustTest<CR>', { buffer = bufnr })
            vim.keymap.set('n', '<Leader>rd', '<cmd>RustDebuggables<CR>', { buffer = bufnr })
            vim.keymap.set('n', '<Leader>rh', '<cmd>RustHoverActions<CR>', { buffer = bufnr })
          end
        }
      })
    end
  },
  
  -- Editor enhancements
  'ntpeters/vim-better-whitespace',
  'vim-scripts/AutoClose',
  'mileszs/ack.vim',
  
  -- Copilot
  { 'github/copilot.vim' },
  
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  
  -- Treesitter
  'RRethy/nvim-treesitter-endwise',
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "VeryLazy" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
          local move = require("nvim-treesitter.textobjects.move")
          local configs = require("nvim-treesitter.configs")
          for name, fn in pairs(move) do
            if name:find("goto") == 1 then
              move[name] = function(q, ...)
                if vim.wo.diff then
                  local config = configs.get_module("textobjects.move")[name]
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
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "html", "javascript", "json", "lua", "markdown", "markdown_inline",
        "vim", "yaml", "ruby", "go", "python", "typescript", "tsx", "css", "rust"
      },
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
      endwise = {
        enable = true,
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
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
}