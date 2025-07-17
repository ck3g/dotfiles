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