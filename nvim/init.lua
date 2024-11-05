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

local plugins = {
  'tpope/vim-fugitive',
  'tpope/vim-rails',
  'tpope/vim-endwise',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'yamatsum/nvim-nonicons',
  'ryanoasis/vim-devicons',
  -- 'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'scrooloose/nerdtree',
  'kien/ctrlp.vim',
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
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  { "olimorris/onedarkpro.nvim", priority = 1000 },
  { 'junegunn/seoul256.vim', priority = 1000 },
  { "savq/melange-nvim", priority = 1000 },
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
      ensure_installed = { "html", "javascript", "json", "lua", "markdown", "markdown_inline", "vim", "yaml", "ruby", "go" },
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


vim.o.background = "dark" -- or "light" for light mode
vim.o.termguicolors = true
require("gruvbox").setup({
  bold = false,
  contrast = "soft",
})

vim.cmd([[colorscheme gruvbox]])
-- vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme melange")
-- vim.cmd("colorscheme seoul256")

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
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

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('nvim-treesitter.configs').setup {
    endwise = {
        enable = true,
    },
}


-- Toggle Code Suggestions on/off with CTRL-g in normal mode:
-- vim.keymap.set('n', '<C-g>', '<Plug>(GitLabToggleCodeSuggestions)')


-- https://github.com/orgs/community/discussions/16800
-- vim.g.copilot_node_command = "~/.nvm/versions/node/v16.15.0/bin/node"
-- vim.g.copilot_node_command = "~/.asdf/shims/node"


--[[]]--

