-- Essential vim settings ported to neovim
vim.g.mapleader = ","

-- Basic editor settings
vim.o.clipboard = "unnamed"
vim.o.backspace = "indent,eol,start"
vim.o.history = 1000
vim.o.showcmd = true
vim.o.showmode = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.number = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.showbreak = "..."
vim.o.hidden = true

-- Visual settings
vim.o.visualbell = true
vim.o.errorbells = false
vim.o.laststatus = 2
vim.o.winwidth = 85

-- Indentation settings
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true

-- Folding settings
vim.o.foldmethod = "indent"
vim.o.foldnestmax = 3
vim.o.foldenable = false

-- Command line completion
vim.o.wildmode = "list:longest"
vim.o.wildmenu = true
vim.o.wildignore = "*.o,*.obj,*~"

-- Scrolling
vim.o.scrolloff = 3
vim.o.sidescrolloff = 7
vim.o.sidescroll = 1

-- Format options
vim.o.formatoptions = vim.o.formatoptions:gsub("o", "") -- don't continue comments with o/O

-- Mouse support
vim.o.mouse = "a"

-- File type settings
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- UI settings
vim.o.signcolumn = "yes"
vim.o.background = "dark"
vim.o.termguicolors = true

-- Diagnostics (enabled by default in Neovim 0.11)
vim.diagnostic.config({ virtual_text = true })

-- Colorscheme setup (will be loaded after plugins)
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    pcall(require, "gruvbox")
    pcall(function()
      require("gruvbox").setup({
        bold = false,
        contrast = "soft",
      })
    end)
    vim.cmd("colorscheme catppuccin-macchiato")
  end,
})