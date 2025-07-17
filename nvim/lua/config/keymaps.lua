-- RuboCop plugin settings
vim.g.vimrubocop_rubocop_cmd = 'bundle exec rubocop '
vim.g.vimrubocop_config = '.rubocop.yml'
vim.g.vimrubocop_keymap = 0
vim.api.nvim_set_keymap('n', '<Leader>r', ':RuboCop<CR>', { noremap = true, silent = true })

-- LSP keybindings
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", function()
  vim.lsp.buf.code_action({ context = { only = { "source.fixAll" } }, apply = true })
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Python isort shortcut
vim.keymap.set("n", "<leader>i", function()
  vim.cmd("silent !isort " .. vim.fn.shellescape(vim.fn.expand("%")))
  vim.cmd("edit!")
end, { noremap = true, silent = true })

-- Telescope keybindings
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