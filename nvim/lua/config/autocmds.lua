-- Essential vim autocmds ported to neovim

-- Jump to last cursor position when opening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    if vim.bo.filetype ~= "gitcommit" then
      local last_pos = vim.fn.line("'\"")
      if last_pos > 0 and last_pos <= vim.fn.line("$") then
        vim.cmd("normal! g`\"")
        vim.cmd("normal! zz")
      end
    end
  end,
})

-- Git commit message settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 72
  end,
})

-- Ruby file type detection
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {
    "Capfile", "Gemfile", "Rakefile", "Thorfile", "config.ru", 
    ".caprc", ".irbrc", "irb_tempfile*", "*.rabl"
  },
  callback = function()
    vim.bo.filetype = "ruby"
  end,
})

-- Haml file type detection
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.hamlbars",
  callback = function()
    vim.bo.filetype = "haml"
  end,
})

-- Disable visual bell
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.o.visualbell = true
    vim.o.errorbells = false
  end,
})

-- RSpec command setup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.filereadable("Gemfile") == 1 then
      if vim.fn.has("gui_running") == 1 then
        vim.g.rspec_command = "!bundle exec rspec -fd --no-color {spec}"
      else
        vim.g.rspec_command = "!bundle exec rspec -fd {spec}"
      end
    end
  end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.py", "*.js", "*.ts", "*.tsx", "*.jsx" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Automatically restart LSP servers when Gemfile.lock is updated
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "Gemfile.lock",
  callback = function()
    vim.cmd("LspRestart")
  end,
})