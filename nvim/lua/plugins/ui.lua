return {
  -- Colorschemes
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  
  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  
  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
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
    end
  },
  
  -- Buffer line
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = true
  },
  
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    opts = {
      size = 20,
      open_mapping = "<c-s>",
      shade_terminals = false,
    }
  },
  
  -- Icons
  'nvim-tree/nvim-web-devicons',
  'yamatsum/nvim-nonicons',
  'ryanoasis/vim-devicons',
  
  -- Dead column indicator
  { 'Bekaboo/deadcolumn.nvim' },
}