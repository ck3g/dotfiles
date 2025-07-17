-- Load old vimrc for compatibility
vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

-- Diagnostics (enabled by default in Neovim 0.11)
vim.diagnostic.config({ virtual_text = true })

-- UI settings
vim.o.signcolumn = "yes"
vim.o.background = "dark"
vim.o.termguicolors = true

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